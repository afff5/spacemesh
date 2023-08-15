# Use the official Ubuntu 22.04 base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    git-lfs \
    make \
    curl \
    build-essential \
    unzip \
    wget \
    ocl-icd-opencl-dev \
    libudev-dev

# Download and install Go 1.19
ENV GO_VERSION=1.19
ENV GO_TAR=go${GO_VERSION}.linux-amd64.tar.gz
ENV GO_URL=https://golang.org/dl/${GO_TAR}
RUN wget -q ${GO_URL} && tar -C /usr/local -xzf ${GO_TAR} && rm ${GO_TAR}

# Set Go environment variables
ENV PATH=/usr/local/go/bin:$PATH
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:$PATH

# Set the working directory to /app
WORKDIR /app