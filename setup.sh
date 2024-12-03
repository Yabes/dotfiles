#!/usr/bin/env sh

set -e

# Install dependencies
sudo apt update
sudo apt install -y software-properties-common git pip

# Setup ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

# Setup dotfiles
git clone https://github.com/Yabes/dotfiles
cd dotfiles
ansible-galaxy install -r requirements.yml

# Ensure cargo bin is found during install
export PATH=$HOME/.cargo/bin:$PATH

# Install everything!
ansible-playbook -K main.yml
