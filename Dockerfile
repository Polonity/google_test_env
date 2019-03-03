FROM ubuntu:18.04

MAINTAINER mtan <hiken.pc@gmail.com>

RUN apt update
RUN apt install -y \
build-essential \
make \
cmake \
git \
gcovr

RUN mkdir /workspace
WORKDIR /workspace

