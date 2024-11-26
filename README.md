# Home config

## Setup

```sh
# Install dependencies
sudo apt update
sudo apt install software-properties-common

# Setup ansible
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
ansible-galaxy install -r requirements.yml

# Install everything!
ansible-playbook main.yml
```
