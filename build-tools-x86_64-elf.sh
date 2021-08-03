#!/usr/bin/env bash

export PREFIX="/usr/local/x86_64-elf-gcc"
export TARGET=x86_64-elf
export PATH="$PREFIX/bin:$PATH"

# Binutils
mkdir /tmp/src
cd /tmp/src
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz # If the link 404's, look for a more recent version
tar xf binutils-2.24.tar.gz
mkdir binutils-build-x86_64
cd binutils-build-x86_64
make distclean
../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
make all install 2>&1 | tee make.log

# GCC
cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-11.1.0/gcc-11.1.0.tar.gz
tar xf gcc-11.1.0.tar.gz
mkdir gcc-build-x86_64
cd gcc-build-x86_64
make distclean
../gcc-11.1.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

# GDB
cd /tmp/src
curl -O http://ftp.rediris.es/mirror/GNU/gdb/gdb-10.2.tar.gz
tar xf gdb-10.2.tar.gz
mkdir gdb-build-x86_64
cd gdb-build-x86_64
make distclean
../gdb-10.2/configure --target="$TARGET" --prefix="$PREFIX" --program-prefix=x86_64-elf-
make
make install