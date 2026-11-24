ssh-keygen -t ed25519
ssh-copy-id ubuntu@web1
ssh-copy-id ubuntu@web2
ssh-copy-id ubuntu@db1
ssh-copy-id ubuntu@db2
mkdir ~/instituto && cd ~/instituto
nano ansible.cfg
nano inventory.yml
ansible-inventory --graph
ansible all -m ping
ansible all -m command -a "uptime"
ansible all -a "df -h"
ansible all -m shell -a "cat /etc/passwd | wc -l"
ansible all -a "hostname"
ansible all -a "uname -r"
ansible all -a "free -h"
nano primer.yml
ansible-playbook --syntax-check primer.yml
ansible-playbook --check primer.yml
ansible-playbook primer.yml
nano nginx.yml
ansible-playbook nginx.yml
nano estado.yml
ansible-playbook --syntax-check estado.yml
ansible-lint estado.yml
ansible-playbook estado.yml
ansible webservers -b -m service -a "name=nginx state=stopped"
ansible webservers -a "pgrep -a nginx"
ansible webservers -b -m apt -a "name=nginx state=absent purge=true"
ansible webservers -a "ss -tln"
exit
