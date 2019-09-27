#!/bin/bash


export ESMF_DIR=`pwd`
export ESMF_INSTALL_PREFIX=${PREFIX}
export ESMF_INSTALL_BINDIR=${PREFIX}/bin
export ESMF_INSTALL_DOCDIR=${PREFIX}/doc
export ESMF_INSTALL_HEADERDIR=${PREFIX}/include
export ESMF_INSTALL_LIBDIR=${PREFIX}/lib
export ESMF_INSTALL_MODDIR=${PREFIX}/mod
export ESMF_NETCDF="split"
export ESMF_NETCDF_INCLUDE=${PREFIX}/include
export ESMF_NETCDF_LIBPATH=${PREFIX}/lib

# Needed for mpich-v3 support.
#export ESMF_CXXLINKLIBS=-lmpifort

#if [ "$(uname)" == "Darwin" ]; then
#    export ESMF_COMM=mpiuni
#    export ESMF_COMM=openmpi
#else
export ESMF_COMM=mpich3
#fi

make  -j ${CPU_COUNT}

#make all_tests
#make check

make install

# ESMPy ========================================================================

export ESMFMKFILE=${PREFIX}/lib/esmf.mk
ESMPY_SRC=${SRC_DIR}/src/addon/ESMPy
cd ${ESMPY_SRC}

${PYTHON} setup.py build --ESMFMKFILE=${ESMFMKFILE} || exit 1
${PYTHON} setup.py test || exit 1
#${PYTHON} setup.py test_all || exit 1
${PYTHON} setup.py install || exit 1

#${PYTHON} setup.py test_examples || exit 1
#${PYTHON} setup.py test_parallel || exit 1
#${PYTHON} setup.py test_examples_parallel || exit 1
