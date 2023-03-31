Usage:
```shell
sudo apt-install python3 python3-pip
python3 -m pip install ansible 
ANSIBLE_STDOUT_CALLBACK=debug ansible-playbook -C local -K -i localhost, -v playbook.yml
```