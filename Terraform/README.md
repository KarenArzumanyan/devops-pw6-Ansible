# Чать 1. Развёртывание серверов.

## Кртакая инструкция по использованию

0. Перейти в каталог
```console
cd d:\Devops\Projects\Repo\devops-pw6-Ansible\Terraform\
```

1. Инициализация 
```console
terraform init
```

2. Применение
```console
terraform apply
```

3. Удаление
```console
terraform destroy
```

# Чать 2. Настройка.

## Создание пользователя ansible на VM-1

Создаём пользователя "ansible" с паролем "ansible", папку для ключей и даём права sudo:

```console
sudo adduser ansible
sudo mkdir -p /home/ansible/.ssh
sudo chown -R ansible:ansible /home/ansible/.ssh
sudo bash -c 'echo $ANSIBLE_USER_PUBLIC_KEY >> /home/ansible/.ssh/authorized_keys'
sudo usermod -a -G sudo ansible
```

## SSH права доступа к файлам ключей на VM

Преключаемся под нового пользователя и создаём ключи без парольной фразы, для корректной работы скриптов

```console
su ansible
cd /home/ansible/
ssh-keygen 
```
Чистаем файл публичного ключа и переносим его на VM-2 и VM-3
```console
cd /home/ansible/
cat ~/.ssh/id_rsa.pub
```

На VM-2 и VM-3 создаём файл с ключём и добавляем кго в .shh
```console
echo "ssh-rsa AAAAB1E.....qDeFR= nsible@edu-vm1-ubuntu-2004" >> vm1_key.pub
cat vm1_key.pub

cat vm1_key.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys
```
После чего можем подключится из VM-1 к удалённым VM-2 и VM-3. Чрез пользователя ubuntu который есть на них.
```console
ssh -i ~/.ssh/id_rsa ubuntu@192.168.10.13
```

# Чать 2. Устанвока, настройка и использование Ansible.

## Устанвока Ansible

```console
sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

## Настройка

```
sudo nano /etc/ansible/ansible.cfg

[defaults]
remote_user = ubuntu
sudo_user = ubuntu
remote_port             = 22
timeout                 = 10
host_key_checking       = False
ssh_executable          = /usr/bin/ssh
private_key_file        = ~/.ssh/id_rsa
inventory               = hosts

[privilege_scalation]

become                  = True
become_method           = sudo
become_user             = ubuntu
become_ask_pass         = False

```console

## Создание файла Inventory и плейбуков

```console
su ansible 
cd /home/ansible/
sudo nano /etc/ansible/hosts
nano playbook-anyos-docker.yml
nano playbook-ubuntu-postgresql.yml
```

## Тест связи через Ansible

```console
ansible all -i inventory-hosts.ini -m ping
```

## Запус плейбуков Ansible

```console
ansible-playbook playbook-anyos-docker.yml
ansible-playbook playbook-ubuntu-postgresql.yml
```