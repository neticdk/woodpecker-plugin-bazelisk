FROM ubuntu

ARG TARGETARCH
ARG BAZELISK_VERSION=v1.22.0

COPY --from=docker:28.1.1-cli@sha256:3c69ee4af37c4efc954a29aeeb063f2194f3764851239e1fdbaa39c9dfe1157d /usr/local/bin/docker /usr/local/bin/
RUN apt update && apt install -y git curl gcc python3 xz-utils && rm -rf /var/lib/apt/lists/* && \
  ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && \
  curl -L -o /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && chmod +x /usr/local/bin/bazel

WORKDIR /app