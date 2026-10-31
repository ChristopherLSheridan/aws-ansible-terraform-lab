#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}"})/.." && pwd)"

PUBLIC_IP="$(terraform -chdir="$PROJECT_ROOT/terraform" output -raw web_public_ip)"

INVENTORY="$PROJECT_ROOT/ansible/inventory.generated.ini"

cat > "$INVENTORY" <<EOF
[webservers]
${PUBLIC_IP} ansible_user=ubuntu ansible_ssh_private_key_file=${HOME}/.ssh/id_ed25519
EOF

echo "Generated Ansible inventory: $INVENTORY"
