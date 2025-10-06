#!/usr/bin/env python3
"""
Validate all hyperlinks in README.md to ensure none lead to dead pages.

This script checks:
1. All internal hyperlinks point to existing files/directories
2. All paths in the Repository Structure Index section have proper hyperlinks
3. No broken or dead links exist

Exit code 0: All links are valid
Exit code 1: Dead links or missing hyperlinks found
"""

import re
import os
import sys

def validate_readme_links(readme_path='README.md'):
    """Validate all hyperlinks in README.md"""
    
    if not os.path.exists(readme_path):
        print(f"❌ Error: README.md not found at {readme_path}")
        return False
    
    with open(readme_path, 'r') as f:
        content = f.read()
        lines = content.splitlines(keepends=True)
    
    print("="*80)
    print("VALIDATING README.md HYPERLINKS")
    print("="*80)
    
    # Part 1: Check all hyperlinks
    print("\n1. Checking all hyperlinks...")
    link_pattern = r'\[([^\]]+)\]\(([^\)]+)\)'
    all_links = re.findall(link_pattern, content)
    
    internal_links = []
    dead_links = []
    
    for text, path in all_links:
        # Skip external and anchor links
        if path.startswith(('http://', 'https://', '#')):
            continue
        
        internal_links.append((text, path))
        
        # Check if internal link exists
        path_clean = path[2:] if path.startswith('./') else path
        
        # Get the directory where README.md is located
        readme_dir = os.path.dirname(os.path.abspath(readme_path))
        full_path = os.path.join(readme_dir, path_clean)
        
        if not os.path.exists(full_path):
            dead_links.append((text, path, full_path))
            print(f"   ❌ DEAD LINK: [{text}]({path})")
    
    print(f"   Total internal links: {len(internal_links)}")
    print(f"   Dead links: {len(dead_links)}")
    
    # Part 2: Check for non-hyperlinked paths in structure section
    print("\n2. Checking for non-hyperlinked paths in Repository Structure Index...")
    
    in_structure = False
    non_linked = []
    
    for i, line in enumerate(lines, 1):
        if '## 📂 Repository Structure Index' in line:
            in_structure = True
            continue
        if in_structure and (line.startswith('---') or re.match(r'^\s*#+\s', line)):
            break
        
        if in_structure and '*' in line:
            has_link = bool(re.search(r'\[([^\]]+)\]\(([^\)]+)\)', line))
            mentions_path = bool(re.search(r'([a-zA-Z0-9_\-./]+/|[a-zA-Z0-9_\-./]+\.[a-zA-Z0-9_\-]+)', 
                                          line.strip().split('*')[-1] if '*' in line else ''))
            
            if mentions_path and not has_link:
                non_linked.append((i, line.strip()))
                print(f"   ❌ Line {i}: {line.strip()}")
    
    print(f"   Non-hyperlinked paths: {len(non_linked)}")
    
    # Summary
    print("\n" + "="*80)
    print("SUMMARY")
    print("="*80)
    
    all_valid = not dead_links and not non_linked
    
    if dead_links:
        print(f"❌ {len(dead_links)} dead link(s) found")
    else:
        print("✅ All internal hyperlinks are valid")
    
    if non_linked:
        print(f"❌ {len(non_linked)} non-hyperlinked path(s) found")
    else:
        print("✅ All paths in Repository Structure Index are properly hyperlinked")
    
    if all_valid:
        print("\n🎉 SUCCESS! All hyperlinks in README.md are working correctly!")
    
    return all_valid

if __name__ == '__main__':
    # Get the repository root directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    repo_root = os.path.dirname(script_dir)
    readme_path = os.path.join(repo_root, 'README.md')
    
    success = validate_readme_links(readme_path)
    sys.exit(0 if success else 1)
