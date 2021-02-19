FROM registry.access.redhat.com/ubi8/ubi:latest

MAINTAINER vprotect@storware.eu

LABEL name="vProtect Server" \
			vendor="Storware" \
			version="0.3" \
			release="4.1.0" \
			summary="vProtect Server 4.1.0 Image" \
                        description="Storware vProtect is an enterprise backup solution for virtual environments. It facilitates the implementation of virtual machine backup running on every major virtualization, container or cloud platform. It supports multiple backup providers:  file system-based, object storage or enterprise grade backup providers."


COPY docker/licenses /licenses

EXPOSE 8080 8181

ENV USER_NAME vprotect
RUN useradd -r $USER_NAME
ENV VPROTECT_DIR /opt/vprotect
RUN mkdir $VPROTECT_DIR && chown $USER_NAME $VPROTECT_DIR
WORKDIR $VPROTECT_DIR

RUN yum -y update-minimal --security --sec-severity=Important --sec-severity=Critical

#Install dependencies
RUN yum update -y \
    && yum -y install java-11-openjdk python2 procps sudo \
	&& echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile \
    && source /etc/profile


RUN chgrp -R 0 /opt/vprotect && chmod -R g+rwX /opt/vprotect 
COPY docker/vprotect-server-*.rpm $VPROTECT_DIR/vprotect-server.rpm

RUN rpm -ivh --nodeps vprotect-server.rpm

USER $USER_NAME

COPY docker/vprotect-keystore.jks vprotect-keystore.jks

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","ROOT.jar", "--systemproperties", "/opt/vprotect/payara.properties"]
