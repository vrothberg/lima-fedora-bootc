FROM quay.io/fedora/fedora-bootc:40
RUN dnf install -y openssh-server cloud-init sshfs
RUN systemctl enable sshd
RUN ln -s /var /Users
