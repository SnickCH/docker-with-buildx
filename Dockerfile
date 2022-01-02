ARG DOCKER_VERSION=latest
ARG BUILDX_VERSION=latest

FROM ${ARCH}docker/buildx-bin:${BUILDX_VERSION} as buildx

FROM ${ARCH}docker:${DOCKER_VERSION}

COPY --from=buildx /buildx /usr/lib/docker/cli-plugins/docker-buildx
