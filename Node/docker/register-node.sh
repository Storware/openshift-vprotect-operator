#!/usr/bin/env bash
NODE=${1:-"node"}
USER=${2:-"admin"}
PASSWORD=${3:-"vPr0tect"}

./scripts/node_add_ssl_cert.sh vprotect-server 8181

vprotect node -R $NODE $USER https://vprotect-server:8181/api $PASSWORD

cd /opt/vprotect

sudo -u vprotect java -Dport=15700 -jar /opt/vprotect/engine.jar
