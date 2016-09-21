#!/bin/bash -ex

bindir=$( cd -P "$( dirname "$0" )" && pwd )
if [ -h "$0" ]; then
    bindir=$( cd -P "$( dirname "`readlink -n "$0"`" )" && pwd )
fi

mkdir -p output

pandoc -f markdown -t revealjs -i -V theme=night\
 --template=$bindir/template-revealjs.html\
 --no-highlight -o output/slides.html $@ $bindir/default.yaml
