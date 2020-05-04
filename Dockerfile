FROM ubuntu:18.04

RUN apt update && apt install -y \
build-essential \
make \
cmake \
git \
gcovr \
cloc

RUN mkdir /workspace
WORKDIR /workspace
