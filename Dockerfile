FROM ubuntu@sha256:a08e551cb33850e4740772b38217fc1796a66da2506d312abe51acda354ff061

ARG TARGETARCH
ARG BAZELISK_VERSION=v1.22.0

COPY --from=docker:28.3.3-cli@sha256:d87c674b7f01043207f1badc6e86e1f8bc33a90981c2f31f3e0f57c1ecb0c5cc /usr/local/bin/docker /usr/local/bin/
RUN apt update && apt install -y git curl gcc python3 xz-utils && rm -rf /var/lib/apt/lists/* && \
  ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && \
  curl -L -o /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && chmod +x /usr/local/bin/bazel

WORKDIR /app