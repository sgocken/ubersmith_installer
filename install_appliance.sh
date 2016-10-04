#!/usr/bin/env bash
set -e

# SSL and Python development libraries are required.
# sudo yum install gcc libffi-devel python-devel openssl-devel
# sudo apt-get install build-essential libssl-dev libffi-dev python-dev

export PATH="~/.local/bin:$PATH"

echo "Checking for pip..."
if command -v pip >/dev/null 2>&1; then
    echo "Installing Ansible..."
    pip install ansible -q --upgrade --user
else
    if command -v easy_install 2>/dev/null; then
        easy_install --user pip
    else
        echo "Both easy_install and pip are missing; please install pip."
        echo "https://pip.pypa.io/en/stable/installing/"
        exit 1
    fi
    echo "Installing Ansible..."
    pip install ansible -q --upgrade --user
fi
echo "Installing Ubersmith Appliance..."
ansible-playbook -i ./hosts -c local install_appliance.yml