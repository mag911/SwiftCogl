#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
Mod=Cogl
Module=${Mod}-1.0
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
mod=`echo "${Mod}" | tr '[:upper:]' '[:lower:]'`
BUILD_DIR=`pwd`/.build
export PATH="${BUILD_DIR}/gir2swift/.build/release:${BUILD_DIR}/gir2swift/.build/debug:${PATH}"
export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig:${PKG_CONFIG_PATH}
LINKFLAGS=`pkg-config --libs $module cogl-gl-1.0 cogl-path-1.0 gobject-2.0 gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//' | tr '\n' ' ' | sed -e 's/-Xcc[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xlinker[ 	]*-Xcc/-Xcc/g' -e 's/-Xlinker[ 	]*--export-dynamic//g' -e 's/-Xlinker[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//'`
CCFLAGS=`pkg-config --cflags $module cogl-gl-1.0 cogl-path-1.0 gobject-2.0 gio-unix-2.0 glib-2.0 | tr ' ' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' | sed -e 's/-Xcc[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xlinker[ 	]*-Xcc/-Xcc/g' -e 's/-Xlinker[ 	]*--export-dynamic//g' -e 's/-Xlinker[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//'`
TAC="tail -r"
if which tac >/dev/null ; then
   TAC=tac
   else if which gtac >/dev/null ; then
	TAC=gtac
   fi
fi
