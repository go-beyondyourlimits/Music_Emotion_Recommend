FROM ubuntu:18.04 AS base
LABEL maintainer="Ryosuke Ozaki"

ARG HOME="/root/"
ENV HOME="${HOME}"
WORKDIR  ${HOME}

# 対話シェルの回避
ENV DEBIAN_FRONTEND noninteractive
# Unicode指定(日本語対応)
ENV PYTHONIOENCODING utf-8
# Install pip3, tmux, git
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        vim \
        wget \
        python3 \
        python3-pip \
        tmux \
        git \
        nodejs \
        curl \
        npm
    #W&& apt-get clean
    # && rm -rf /var/lib/apt/lists/*

# yarn install
RUN apt remove -y cmdtest
RUN apt remove -y yarn
RUN apt-get install -y gnupg2
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends yarn

# Install Python Packages
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
# Install Node.js Packages
RUN npm install -g n
RUN n latest
RUN npm install -g create-react-app
# PATHを通す
RUN echo "export PATH=$PATH:/usr/local/lib/python3.6/dist-packages/" >> ~/.bashrc
