# UTCS: UTCS-MI:RLG:INFRA:00-10:INFRANET-RETAIL-LOGISTICS:rev[A]
# TFA: QS→FWD→UE→FE→CB→QB
# License: Apache-2.0
# Notes: PCS-A compliant OPA/Rego ABAC policies for retail logistics

package pcs_a.authz

import future.keywords.if
import future.keywords.in

# ==============================================================================
# DEFAULT DENY
# ==============================================================================

default allow := false

# ==============================================================================
# EPCIS EVENT QUERIES (READ-ONLY)
# ==============================================================================

# Allow operators and auditors to read EPCIS events
allow if {
    input.action == "read"
    input.resource.class == "epcis:event"
    input.subject.role in {"Operator", "Auditor", "Manager"}
    has_project_access
}

# Allow external partners to read events they are authorized for
allow if {
    input.action == "read"
    input.resource.class == "epcis:event"
    input.subject.role == "Partner"
    partner_authorized_for_resource
}

# ==============================================================================
# OSLC RESOURCE ACCESS
# ==============================================================================

# Allow read access to shipments for authorized roles
allow if {
    input.action == "read"
    input.resource.class == "oslc:Shipment"
    input.subject.role in {"Operator", "Auditor", "Manager", "Carrier"}
    has_project_access
}

# Allow read access to orders for authorized roles
allow if {
    input.action == "read"
    input.resource.class == "oslc:Order"
    input.subject.role in {"Operator", "Auditor", "Manager", "Customer"}
    has_project_access
}

# ==============================================================================
# BPMN TASK EXECUTION
# ==============================================================================

# Allow task execution if workload is authorized via SPIFFE ID
allow if {
    input.action == "execute_task"
    input.task == "validate-order"
    input.subject.workload.spiffe_id == "spiffe://orgA/mopc/validator"
}

allow if {
    input.action == "execute_task"
    input.task == "check-inventory"
    input.subject.workload.spiffe_id == "spiffe://orgA/connector/wms"
}

allow if {
    input.action == "execute_task"
    input.task == "pick-items"
    input.subject.workload.spiffe_id == "spiffe://orgA/connector/wms"
    input.subject.role in {"Operator", "Warehouse"}
}

allow if {
    input.action == "execute_task"
    input.task == "pack-items"
    input.subject.workload.spiffe_id == "spiffe://orgA/connector/wms"
    input.subject.role in {"Operator", "Warehouse"}
}

allow if {
    input.action == "execute_task"
    input.task == "create-shipment"
    input.subject.workload.spiffe_id == "spiffe://orgA/connector/tms"
}

allow if {
    input.action == "execute_task"
    input.task == "anchor-evidence"
    input.subject.workload.spiffe_id == "spiffe://orgA/mopc/anchor"
    input.subject.role == "System"
}

# ==============================================================================
# DLT ACCESS
# ==============================================================================

# Allow DLT evidence anchoring for authorized systems
allow if {
    input.action == "dlt:anchor"
    input.subject.workload.spiffe_id in {
        "spiffe://orgA/mopc/anchor",
        "spiffe://orgB/mopc/anchor"
    }
    input.resource.dltNetwork in {"fabric", "besu"}
}

# Allow DLT evidence queries for auditors
allow if {
    input.action == "dlt:query"
    input.subject.role in {"Auditor", "Manager"}
    has_project_access
}

# ==============================================================================
# DATA CLASSIFICATION & EXPORT CONTROL
# ==============================================================================

# Check data classification labels
allow if {
    input.action == "read"
    has_project_access
    check_classification_clearance
}

check_classification_clearance if {
    input.resource.classification == "PUBLIC"
}

check_classification_clearance if {
    input.resource.classification == "INTERNAL"
    input.subject.clearance in {"INTERNAL", "CONFIDENTIAL", "RESTRICTED"}
}

check_classification_clearance if {
    input.resource.classification == "CONFIDENTIAL"
    input.subject.clearance in {"CONFIDENTIAL", "RESTRICTED"}
}

check_classification_clearance if {
    input.resource.classification == "RESTRICTED"
    input.subject.clearance == "RESTRICTED"
}

# Export control for international data sharing
allow if {
    input.action == "export"
    input.subject.role in {"Manager", "Compliance"}
    check_export_compliance
}

check_export_compliance if {
    # EU-only data can only go to EU entities
    input.resource.tags.region == "EU"
    input.destination.region == "EU"
}

check_export_compliance if {
    # ITAR-controlled data requires special clearance
    not input.resource.tags.itar
}

check_export_compliance if {
    input.resource.tags.itar == true
    input.subject.clearance_itar == true
    input.destination.itar_approved == true
}

# ==============================================================================
# HELPER RULES
# ==============================================================================

# Check if subject has access to the project/organization
has_project_access if {
    input.context.project in input.subject.projects
}

has_project_access if {
    input.context.organization in input.subject.organizations
}

# Check if partner is authorized for specific resource
partner_authorized_for_resource if {
    input.subject.role == "Partner"
    input.resource.partnerId in input.subject.authorized_partners
}

# ==============================================================================
# AUDIT LOGGING
# ==============================================================================

# Always log denials for audit trail
deny_reason contains msg if {
    not allow
    msg := sprintf("Access denied: action=%v, resource=%v, subject=%v", 
        [input.action, input.resource.class, input.subject.id])
}

# Log all access attempts to sensitive resources
audit_log contains entry if {
    input.resource.classification in {"CONFIDENTIAL", "RESTRICTED"}
    entry := {
        "timestamp": time.now_ns(),
        "action": input.action,
        "subject": input.subject.id,
        "resource": input.resource.id,
        "decision": allow
    }
}
