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
ansible-playbook setup.yml -l your-inventory-file -Kk
```

Afterward:
```
ansible-playbook setup.yml -l your-inventory-file
```