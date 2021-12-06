# docker image with buildx installed - weekly updated

A DIND (Docker in Docker) image with buildx to build multi platform docker images. 
Difference to the main image
- Weekly updated (gitlab pipeline)
- I try to use the newest version of buildx for the stable tag (at the moment 0.7.1) https://github.com/docker/buildx/releases/

You can use this in your gitlab pipeline on a gitlab runner or locally. If you use a gitlab runner make sure that you have the privileged flag enabled in your config.toml file (etc/gitlab-runner/config.toml)

```bash

 [runners.docker]
 ...
    privileged = true
 ...
```

# Docker image

https://hub.docker.com/repository/docker/snickch/buildx/general

```bash
docker pull snickch/buildx:latest
```
