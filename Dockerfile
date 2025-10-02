FROM ubuntu@sha256:fdb6c9ceb1293dcb0b7eda5df195b15303b01857d7b10f98489e7691d20aa2a1

ARG TARGETARCH
ARG BAZELISK_VERSION=v1.22.0

COPY --from=docker:28.4.0-cli@sha256:6a73c9433f2ba4279815be1e60f5739288b939dda1e48151d8c393537802de37 /usr/local/bin/docker /usr/local/bin/
RUN apt update && apt install -y git curl gcc python3 xz-utils && rm -rf /var/lib/apt/lists/* && \
  ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && \
  curl -L -o /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && chmod +x /usr/local/bin/bazel

WORKDIR /app