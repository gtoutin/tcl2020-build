#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /work/socketservertcl ]; then
	cd /work && sh /builds/download-socketservertcl.sh
fi

cd /work/socketservertcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include
make && make install

build_cleanup
