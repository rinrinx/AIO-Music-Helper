FROM ubuntu:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get -qq update --fix-missing

RUN apt-get -y update && apt-get -y upgrade && \ apt-get -y update && \
    apt-get install -y git wget curl python3 python3-pip python3-lxml \
    tzdata p7zip-full p7zip-rar xz-utils curl wget pv jq \
    ffmpeg locales neofetch git make g++ gcc automake unzip \
    autoconf libtool libsodium-dev libcurl4-openssl-dev libc-ares-dev swig \
    libssl-dev libcrypto++-dev zlib1g-dev libsqlite3-dev libfreeimage-dev

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt


COPY . .

CMD ["bash","start.sh"]
