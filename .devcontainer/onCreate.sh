#!/bin/bash
chown root:kvm /dev/kvm && chmod 660 /dev/kvm
/usr/sbin/libvirtd -d
/usr/sbin/virtlogd -d

# Setup SSH
mkdir -p $HOME/.ssh && chmod 660 $HOME/.ssh
cat << EOF > $HOME/.ssh/config
Host 192.168.*
	StrictHostKeyChecking no
	UserKnownHostsFile /dev/null
	LogLevel ERROR
EOF
ssh-keygen -t rsa -q -f "$HOME/.ssh/id_rsa" -N ""

# Download uvtool + ubuntu image
apt-get install -y uvtool
uvt-simplestreams-libvirt sync release=bionic arch=amd64

# install 1st vm
uvt-kvm create aos_vm1 release=bionic --memory=512 --no-start
uvt-kvm wait aos_vm1

# Clone as many as you want
for i in {2..8}; do
	virt-clone --original aos_vm1 --name aos_vm$i --auto-clone
done

pkill libvirtd
pkill virtlogd
