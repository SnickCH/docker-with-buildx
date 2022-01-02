# Docker image with buildx (amd64,arm64) installed - weekly updated

A DIND (Docker in Docker) image with buildx to build multi platform docker images. 

Documentation: https://github.com/SnickCH/docker-with-buildx

Key features
- Weekly updates for the latest version of buildx: I try to use the newest version of buildx for the "latest" tag https://github.com/docker/buildx/releases/
- Different versions are available if you need older ones
- I will add examples on how to get startet with Git Lab
- amd64 (tested) and arm64 (not tested)

## Docker image and tags

In addition to the "latest" tag (amd64 and arm64), there are older tags available. Please check the docker hub site of the project for the tags if you need older one

https://hub.docker.com/r/snickch/buildx

```bash
docker pull snickch/buildx:latest
```

## Gitlab runner requirements
You can use this in your gitlab pipeline on a gitlab runner or locally. If you use a gitlab runner make sure that you have the privileged flag enabled in your config.toml file (/etc/gitlab-runner/config.toml)

```bash

 [runners.docker]
 ...
    privileged = true
 ...
 
 
```
## Gitlab Examples
In this examples, the variables are set on a project base. Make sure you set the variables that it works for your setup

File: .gitlab-ci.yml
```
image: snickch/buildx:latest

variables:
  DOCKER_DRIVER: overlay2
  DOCKER_TLS_CERTDIR: ""

services:
- name: docker:dind
  alias: thedockerhost

build:
  stage: build

  script:
    - docker version
    - docker login -u $dhub_user -p $dhub_password
    - docker buildx create --use
    - docker buildx build --push --platform linux/arm64,linux/amd64,linux/arm/v7,linux/arm/v6 --tag $CI_REGISTRY .
```
File: Dockerfile
```
ARG ARCH=
FROM ${ARCH}debian:stable
# Install your packages you need
RUN apt-get update && apt-get install -y ....
```
The packages you want to install must be available for your plattform that you want to build for (example: arm, amd64 etc.)

##Testing the version of buildx
If you want to test or troubleshoot if buildx is running in the image, you can do this manually on any docker instance with the following command (replace latest with the version, if you want to test an older one)
```
 docker run --rm -it  --name bx --privileged snickch/buildx:latest buildx version
```



