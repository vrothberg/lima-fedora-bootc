FROM quay.io/fedora/fedora-bootc:40
RUN dnf install -y openssh-server cloud-init sshfs moby-engine
RUN systemctl enable sshd
