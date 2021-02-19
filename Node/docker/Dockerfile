FROM registry.access.redhat.com/ubi8/ubi:latest

MAINTAINER vprotect@storware.eu

LABEL name="vProtect Node" \
                        vendor="Storware" \
                        version="0.2" \
                        release="4.1.0" \
                        summary="vProtect Node 4.1.0 Image" \
                        description="Storware vProtect is an enterprise backup solution for virtual environments. It facilitates the implementation of virtual machine backup running on every major virtualization, container or cloud platform. It supports multiple backup providers:  file system-based, object storage or enterprise grade backup providers."

COPY docker/licenses /licenses

ENV USER_NAME vprotect
RUN adduser $USER_NAME
RUN passwd -d vprotect
RUN usermod -aG wheel vprotect

ENV VPROTECT_DIR /opt/vprotect
RUN mkdir $VPROTECT_DIR
RUN chown $USER_NAME $VPROTECT_DIR

WORKDIR $VPROTECT_DIR
RUN chgrp -R 0 /opt/vprotect && chmod -R g+rwX /opt/vprotect
COPY docker/vprotect.repo /etc/yum.repos.d/vprotect.repo
COPY docker/vprotect-node-*.rpm $VPROTECT_DIR/vprotect-node.rpm
COPY docker/register-node.sh $VPROTECT_DIR/register-node.sh
RUN chmod a+x $VPROTECT_DIR/register-node.sh

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN yum -y update-minimal --security --sec-severity=Important --sec-severity=Critical

RUN yum install openssl -y \
                sudo \
                nc \
                net-tools \
                curl

RUN yum install vprotect-node.rpm -y
RUN chgrp -R 0 /opt/vprotect && chmod -R g+rwX /opt/vprotect
RUN chown $USER_NAME:$USER_NAME /opt/vprotect/register-node.sh
ENTRYPOINT ["sh", "/opt/vprotect/register-node.sh"]
