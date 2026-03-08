FROM ubuntu@sha256:cd1dba651b3080c3686ecf4e3c4220f026b521fb76978881737d24f200828b2b

ARG TARGETARCH
ARG BAZELISK_VERSION=v1.22.0

COPY --from=docker:29.3.0-cli@sha256:067c301efe497cd5d174d468b7b3422a485ae4aca8f7ec1ffd4655c9fa383af2 /usr/local/bin/docker /usr/local/bin/
RUN apt update && apt install -y git curl gcc python3 xz-utils && rm -rf /var/lib/apt/lists/* && \
  ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip && \
  curl -L -o /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${BAZELISK_VERSION}/bazelisk-linux-${TARGETARCH} && chmod +x /usr/local/bin/bazel

WORKDIR /app