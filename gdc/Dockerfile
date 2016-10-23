FROM aliak00/dmd:2.071.2

MAINTAINER Ali Akhtarzada <ali.akhtarzada@gmail.com>

# Install GDC
RUN apt-get update -qq -y \
    && apt-get install -y gdc

ENV D_COMPILER=gdc

WORKDIR /tmp

# Run a small test on compilers
RUN echo "import std.stdio; void main() { writeln(\"gdc ok!\"); }" > hellogdc.d && gdc hellogdc.d -o hellogdc && ./hellogdc \
    && rm -rf *
