#!/bin/bash
chown root:kvm /dev/kvm && chmod 660 /dev/kvm
/usr/sbin/libvirtd -d
/usr/sbin/virtlogd -d

pwd
make