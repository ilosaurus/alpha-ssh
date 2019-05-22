# SSH Access reporting
### this project inspired by [alpha-server-client-ssh-reporting](https://github.com/terminalninja/alpha-server-client-ssh-reporting ) 

SSH Access reporting tool is written on python.   The deployment/configuration is automated with Ansible. The reporting too has three parts
  - alpha_server.py
  - alpha_client.py
  - alpha_report.py

## Requirements

  - python2.7
  - python-pip
  - python-dev
  - python-mysqldb
  - libmysqlclient-dev
  - python-setuptools
  - mysql-connector-python
  - mysql-server
  - apache2
  - php7.0
  - php7.0-mysql
  - libapache2-mod-php7.0

## Provisioning Instance on Openstack
if you using openstack as enviroment deployment. Automated deployment instance with terraform.
```bash
cd terraform
vim provider.tf
vim variable.tf
terraform init
terraform validate
terraform plan
terraform apply
```

## Setup 
- The repo has an Ansible inventory file which is located in **ansible/hosts** add the client and server IP/hostname there.  
- Update alpha_server.py, alpha_client.py and alpha_report.py with server's IP/hostname. 

```bash
cd ansible
vim hosts
    ...
        [client]
        10.199.199.101 #yourclientnodeaddress

        [server]
        10.199.199.109 #yourservernodeaddress

        [all:vars]
        server_address=10.199.199.109 #yourservernodeaddress
        server_port=8888 #yourlistenserverport
        mysql_host=10.199.199.109 #yourservernodeaddress
        mysql_username=alpha #yourmysqlusername
        mysql_password=alpha123 #yourmysqlpassword

    ...

ansible-playbook playbook.yml -i hosts
```
Deployment demo with ansible    
  
**asciinema**
[![asciicast](https://asciinema.org/a/247839.svg)](https://asciinema.org/a/247839)  
  
**Video**   
https://drive.google.com/file/d/1ihgUrNICxkoYQ1GuhLJTPIcPbsYwEmTb/view?usp=sharing  






