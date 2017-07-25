FROM ubuntu

ARG concourse_url

RUN apt-get update && \
    apt-get install -y wget && \
    wget "${concourse_url}/api/v1/cli?arch=amd64&platform=linux" -O /usr/bin/fly && \
    chmod +x /usr/bin/fly

ENV CONCOURSE_URL ${concourse_url}
