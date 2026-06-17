#!/bin/bash
set -e

export PSPDEV="$HOME/pspdev"
export PATH="$PATH:$PSPDEV/bin"

cd topx-c++
touch src/text.cpp
make -s "$@"
cp -f julian-top.a ..
cd -
