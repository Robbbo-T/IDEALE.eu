# CAS — Computer-Aided Service (ATA 55)
UTCS: UTCS-MI:AAA:CAS:55:INDEX:rev[A] · Estado: Template

**CAS** orquesta el servicio en operación (forecast, ejecución y evidencia) y **publica** los productos:
**AMM**, **SRM**, **IPD**, **EIS**.

## Flujo TFA
QS → FWD → **UE** → **FE** → **CB/QB** → **CAS(work)** → **CAS(outputs)**

## Estructura
- **Procesos**: [processes/](./processes/) (BPMN/CMMN, SOPs)
- **Entradas**: [inputs/](./inputs/) (UE hooks, AOG, fleet raw)
- **Trabajo**: [work/](./work/) → [checklists](./work/checklists/) · [task-cards](./work/task-cards/) · [schedules](./work/schedules/)
- **Productos (outputs)**:
  - **AMM**: [outputs/AMM/](./outputs/AMM/README.md)
  - **SRM**: [outputs/SRM/](./outputs/SRM/README.md)
  - **IPD**: [outputs/IPD/](./outputs/IPD/README.md)
  - **EIS**: [outputs/EIS/](./outputs/EIS/README.md)
- **Esquemas**: [schemas/](./schemas/)
- **KPIs**: [kpis/](./kpis/)
- **Políticas**: [policies/](./policies/)

## UTCS (ejemplos)
- Proceso: `UTCS-MI:AAA:CAS:55:PROC:RTS-INSPECTION:rev[A]`
- Work artifact: `UTCS-MI:AAA:CAS:55:TC:55-00-01:rev[A]`
- Output AMM: `UTCS-MI:AAA:CAS:55:OUT:AMM:SCHED:A-CHECK:rev[A]`
- Output SRM: `UTCS-MI:AAA:CAS:55:OUT:SRM:SCHEME:HSKIN-023:rev[A]`
- Output IPD: `UTCS-MI:AAA:CAS:55:OUT:IPD:IPC:FIG-5510-01:rev[A]`
- Output EIS: `UTCS-MI:AAA:CAS:55:OUT:EIS:SB-2025-055-001:rev[A]`
