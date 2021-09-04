FROM ubuntu:18.04 AS base
LABEL maintainer="Ryosuke Ozaki"

ARG HOME="/root/"
ENV HOME="${HOME}"
WORKDIR  ${HOME}

# 対話シェルの回避
ENV DEBIAN_FRONTEND noninteractive
# Unicode指定(日本語対応)
ENV PYTHONIOENCODING utf-8
# Install mysql, pip3, tmux, git
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        vim \
        curl \
        python3 \
        python3-pip \
        tmux \
        git \
        nodejs \
        npm
    #W&& apt-get clean
    # && rm -rf /var/lib/apt/lists/*

# Install Docker
RUN curl -fsSL get.docker.com -o get-docker.sh
RUN sh get-docker.sh
RUN rm get-docker.sh

# Install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Install Python Packages
RUN pip3 install --upgrade pip

# Install Node.js Packages
RUN npm install -g n
RUN n latest
RUN npm install -g create-react-app

# PATHを通す
RUN echo "export PATH=$PATH:/usr/local/lib/python3.6/dist-packages/" >> ~/.bashrc@
