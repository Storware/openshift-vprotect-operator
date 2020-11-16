## Building vProtect Server image
docker build -t storware/vprotect-server:latest -f docker/Dockerfile .

#Deploying vProtect Server
vProtect Server can be created by importing the YAML files included in this package. The MariaDB YAML files should be imported before vProtect Server is deployed.

