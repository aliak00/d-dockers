FROM aliak00/dmd

MAINTAINER Ali Akhtarzada <ali.akhtarzada@gmail.com>

WORKDIR /tmp

# LDC version setup
ARG LDC_VERSION=1.0.0
ARG LDC_NAME="ldc2-$LDC_VERSION-linux-x86_64"
ARG LDC_PATH="/opt/$LDC_NAME"

# Download precompiled ldc
RUN wget --no-check-certificate "https://github.com/ldc-developers/ldc/releases/download/v$(echo $LDC_VERSION)/$(echo $LDC_NAME).tar.xz"

# Move it around, shake it all about
RUN apt-get update -qq -y \
    && apt-get install -y xz-utils \
    && tar xvf "$(echo $LDC_NAME).tar.xz" \
    && mv "$LDC_NAME" "$LDC_PATH"

ENV PATH="$LDC_PATH/bin:$PATH"
ENV D_COMPILER=ldc2

# Run a small test on compilers
RUN echo "import std.stdio; void main() { writeln(\"ldc ok!\"); }" > helloldc.d && ldc2 helloldc.d && ./helloldc \
    && rm -rf *
