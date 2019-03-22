FROM ubuntu:16.04

MAINTAINER Ali Akhtarzada <ali.akhtarzada@gmail.com>

WORKDIR /tmp

RUN apt-get update -qq -y \
    && apt-get install -y --no-install-recommends wget gcc libcurl3 xdg-utils libc6-dev \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/*

ARG DMD_VERSION=2.085.0

RUN set -ex \
    && wget http://downloads.dlang.org/releases/2.x/${DMD_VERSION}/dmd_${DMD_VERSION}-0_amd64.deb \
    && dpkg -i dmd_${DMD_VERSION}-0_amd64.deb \
    && rm -rf dmd* \
    && dmd --version \
    dub --version

ENV D_COMPILER=dmd

RUN echo "import std.stdio; void main() { writeln(\"dmd ok!\"); }" > hellodmd.d && dmd hellodmd.d && ./hellodmd \
    && rm -rf *
