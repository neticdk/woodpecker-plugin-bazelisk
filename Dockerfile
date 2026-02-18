FROM ubuntu@sha256:d1e2e92c075e5ca139d51a140fff46f84315c0fdce203eab2807c7e495eff4f9

ARG TARGETARCH
ARG BAZELISK_VERSION=v1.22.0

COPY --from=docker:29.2.1-cli@sha256:1d6d751f1d68d1a5142c23c730ef5ecc976a8e050fa08c3cdb09f7e2e54a4439 /usr/local/bin/docker /usr/local/bin/
RUN apt update && apt install -y git curl gcc python3 xz-utils && rm -rf /var/lib/apt/lists/* && \
  ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && \
  curl -L -o /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && chmod +x /usr/local/bin/bazel

WORKDIR /app