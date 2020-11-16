FROM quay.io/operator-framework/helm-operator:v0.16.0

# Operator Container Image
LABEL name="vProtect Operator" \
      vendor="Storware" \
      version="v0.0.1" \
      release="1" \
      summary="vProtect Operator Image" \
      description="Storware vProtect is an enterprise backup solution for virtual environments. It facilitates the implementation of virtual machine backup running on every major virtualization, container or cloud platform. It supports multiple backup providers:  file system-based, object storage or enterprise grade backup providers."

# Required Licenses
COPY licenses /licenses

COPY watches.yaml ${HOME}/watches.yaml
COPY helm-charts/ ${HOME}/helm-charts/
