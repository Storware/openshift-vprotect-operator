FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

MAINTAINER vprotect@storware.eu

LABEL name="vProtect Init Image" \
                        vendor="Storware" \
                        version="0.0.1" \
                        release="0.0.1" \
                        summary="Image for init container" \
                        description="Storware vProtect is an enterprise backup solution for virtual environments. It facilitates the implementation of virtual machine backup running on every major virtualization, container or cloud platform. It supports multiple backup providers:  file system-based, object storage or enterprise grade backup providers."


COPY licenses /licenses

ENV USER_ID 1000
RUN microdnf install nc shadow-utils
ENV USER_NAME vprotect
RUN adduser --uid $USER_ID $USER_NAME
USER $USER_ID
