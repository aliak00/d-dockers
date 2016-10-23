FROM ubuntu:16.04

MAINTAINER Ali Akhtarzada <ali.akhtarzada@gmail.com>

WORKDIR /tmp

ARG DMD_VERSION=2.071.2
ARG DUB_VERSION=1.0.0

# Install D reference compiler
RUN apt-get update -qq -y \
    && apt-get install -y --no-install-recommends wget gcc libcurl3 xdg-utils libc6-dev \
    && wget http://downloads.dlang.org/releases/2.x/2.071.2/dmd_$(echo $DMD_VERSION)-0_amd64.deb \
    && dpkg -i dmd_2.071.2-0_amd64.deb

# Install DUB
RUN wget --no-check-certificate https://code.dlang.org/files/dub-$(echo $DUB_VERSION)-linux-x86_64.tar.gz \
    && tar xvf dub-1.0.0-linux-x86_64.tar.gz \
    && mv dub /usr/local/bin/

ENV D_COMPILER=dmd

RUN echo "import std.stdio; void main() { writeln(\"dmd ok!\"); }" > hellodmd.d && dmd hellodmd.d && ./hellodmd \
    && rm -rf *
