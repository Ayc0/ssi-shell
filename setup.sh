#!/bin/zsh

# sudo
echo "sudo:x:101:root,$1" >> /etc/group
echo "\n%sudo ALL=(ALL) ALL\n" >> /etc/sudoers

# Create a user without password and with zsh
adduser --shell /bin/zsh --disabled-password --gecos "" $1
echo $1':'$2 | chpasswd
echo "" > /home/$1/.zshrc

# Python
ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip

# Add ssh keys
ssh-keygen -A

# Start ssh server
/usr/sbin/sshd -D
