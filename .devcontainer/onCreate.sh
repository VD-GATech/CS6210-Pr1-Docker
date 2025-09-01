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

# Let it do in background maybe better than cloning.
for i in {1..8}; do
	uvt-kvm create aos_vm$i release=bionic --memory=512 --no-start
done

pkill libvirtd
pkill virtlogd
