FROM esmf-ubuntu

ENV BB_SANDBOX=${HOME}/sandbox
ENV BB_MPICC=mpicc
ENV BB_MPIF90=mpif90

ENV BB_HDF_NAME=hdf5
ENV BB_HDF_VER=1.10.5
ENV BB_HDF_SANDBOX=${BB_SANDBOX}/${BB_HDF_NAME}/${BB_HDF_VER}
ENV BB_HDF_SRCDIR=${BB_HDF_SANDBOX}/src
ENV BB_HDF_PREFIX=${BB_HDF_SANDBOX}/install
ENV BB_HDF_FILEPREFIX=hdf5-${BB_HDF_VER}
ENV BB_HDF_COMPRESSED=${BB_HDF_FILEPREFIX}.tar.gz
ENV BB_HDF_URL=https://support.hdfgroup.org/ftp/HDF5/current/src/${BB_HDF_COMPRESSED}
ENV BB_HDF_APTPKGS="cmake git zlib1g-dev build-essential gfortran mpich wget tree m4 curl libcurl4-openssl-dev"

RUN apt-get --yes install ${BB_HDF_APTPKGS}

WORKDIR ${BB_HDF_SRCDIR}
#cd ${BB_HDF_SRCDIR}
RUN wget ${BB_HDF_URL}
RUN tar -xzvf ${BB_HDF_COMPRESSED}
WORKDIR ${BB_HDF_FILEPREFIX}

RUN ./configure --enable-parallel --prefix=${BB_HDF_PREFIX}

RUN make
#make check
RUN make install
