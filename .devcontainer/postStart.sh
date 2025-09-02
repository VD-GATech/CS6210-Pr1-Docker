#!/bin/bash
chown root:kvm /dev/kvm && chmod 660 /dev/kvm
/usr/sbin/libvirtd -d
/usr/sbin/virtlogd -d
# Fix lost network after reboot
virsh net-start default

pwd
make
