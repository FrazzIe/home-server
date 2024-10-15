# Home Server

Ansible IaC setup for home server

# References

- https://github.com/notthebee/infra

# Usage

Install the dependencies:
```
ansible-galaxy install -r requirements.yml
```

First run:
```
ansible-playbook -i hosts_inventory.yml route-manager.yml --vault-password-file ~/vault_pwd.txt
```

Afterward:
```
ansible-playbook setup.yml -l your-inventory-file
```