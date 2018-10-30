#!/bin/zsh

# sudo
echo "sudo:x:99:root,$1" >> /etc/group
echo "\n%sudo ALL=(ALL) ALL" >> /etc/sudoers
echo "\n%sudo ALL=(ALL:ALL) NOPASSWD:/usr/local/tests/tests.sh" >> /etc/sudoers

# Create a user without password and with zsh
adduser --shell /bin/zsh --disabled-password --gecos "" $1
echo $1':'$2 | chpasswd
# mv /usr/local/.zshrc /home/$1/.zshrc
echo "" > /home/$1/.zshrc
chown "$1:$1" /home/$1/.zshrc
chown -R "$1:$1" /usr/local/tests

# Add ssh keys
ssh-keygen -A

# Start ssh server
/usr/sbin/sshd -D
