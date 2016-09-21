#!/bin/bash -ex

bindir=$( cd -P "$( dirname "$0" )" && pwd )
if [ -h "$0" ]; then
    bindir=$( cd -P "$( dirname "`readlink -n "$0"`" )" && pwd )
fi

mkdir -p $1
echo "#!/bin/bash -ex" > $1/make.sh
echo "$bindir/reveal.sh slides.md meta.yaml" >> $1/make.sh
cp $bindir/slides.md.template $1/slides.md
cp $bindir/meta.yaml.template $1/meta.yaml
