#!/bin/bash

# WSL startup script

# Set correct ownership and permissions for /dev/kvm
# this script should be added at '/etc/wsl.conf':
# [boot]
# command=/this/file/path
chown root:kvm /dev/kvm
chmod 0660 /dev/kvm
echo '[kvm] permission set'

# Set correct permissions for docker
chmod 666 /var/run/docker.sock
echo '[docker] permission set'

# Update resolv.conf
cp /home/guigallo/personal/dotfiles/wsl/resolv.conf /etc/resolv.conf
