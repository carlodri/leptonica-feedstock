#!/usr/bin/env bash
set -ex

./autogen.sh
# --with-* makes configure fail instead of silently dropping an image format
./configure --prefix=$PREFIX \
    --disable-dependency-tracking \
    --disable-static \
    --with-zlib \
    --with-libpng \
    --with-jpeg \
    --with-giflib \
    --with-libtiff \
    --with-libwebp \
    --with-libwebpmux \
    --with-libopenjpeg
make -j$CPU_COUNT
make install
