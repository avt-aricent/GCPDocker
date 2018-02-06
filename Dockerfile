FROM ubuntu

LABEL maintainer="avthatte@gmail.com"

# Install the necessary libraries
RUN apt-get update && apt-get install -y \
    curl \
    lsb-core \
    && rm -rf /var/lib/apt/lists/*

# Install Google Cloud SDK
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get install -y google-cloud-sdk \
    && rm -rf /var/lib/apt/lists/*
