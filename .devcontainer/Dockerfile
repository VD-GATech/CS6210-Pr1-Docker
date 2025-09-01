# Use the official Ubuntu 22.04 as a base image
FROM ubuntu:22.04

# Install packages
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    build-essential gdb \
    qemu-kvm \
    libvirt-daemon-system libvirt-clients libvirt-dev \
    virt-top virt-manager virtinst \
    python3-libvirt python-is-python3 python3-pandas python3-matplotlib \
    tmux git zip unzip
    
# Load systemd to use some commands such as: systemctl, journalctl, ...
# (Remember to add ["overrideCommand": false] to devcontainer.json)
#ARG DEBIAN_FRONTEND=noninteractive
#RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session \
#    && echo 'root:root' | chpasswd \
#    && printf "systemctl start systemd-logind" >> /etc/profile
#ENTRYPOINT ["/sbin/init"]

# Add the user to the groups for permissions
RUN adduser root kvm && adduser root libvirt