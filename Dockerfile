FROM ubuntu@sha256:c4a8d5503dfb2a3eb8ab5f807da5bc69a85730fb49b5cfca2330194ebcc41c7b

ARG TARGETARCH
ARG BAZELISK_VERSION=v1.22.0

COPY --from=docker:29.7.1-cli@sha256:27a51d5ab1cd38d9eeaba7b415b8c07bc10c31e1cf1ec8d78f6413fcfab3f44f /usr/local/bin/docker /usr/local/bin/
RUN apt update && apt install -y git curl gcc python3 xz-utils && rm -rf /var/lib/apt/lists/* && \
  ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && \
  curl -L -o /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && chmod +x /usr/local/bin/bazel

WORKDIR /app