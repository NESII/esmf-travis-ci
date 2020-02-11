FROM bekozi/esmf-ubuntu

# https://wiki.mpich.org/mpich/index.php/Getting_And_Building_MPICH

ENV BB_MPICH_NAME=mpich
ENV BB_MPICH_VER=3.3.2
ENV BB_MPICH_SANDBOX=${BB_SANDBOX}/${BB_MPICH_NAME}/${BB_MPICH_VER}
ENV BB_MPICH_SRCDIR=${BB_MPICH_SANDBOX}/src-git
ENV BB_MPICH_PREFIX=${BB_MPICH_SANDBOX}/install
ENV BB_MPICH_FILEPREFIX=v${BB_MPICH_VER}
ENV BB_MPICH_URL=https://github.com/pmodels/mpich.git
ENV BB_MPICH_APTPKGS="autoconf libtool"

RUN apt-get -y update && apt-get -y install $BB_MPICH_APTPKGS

WORKDIR $BB_MPICH_SRCDIR
RUN git clone --branch v$BB_MPICH_VER --depth 1 $BB_MPICH_URL
WORKDIR $BB_MPICH_NAME
RUN git submodule update --init
RUN ./autogen.sh
RUN ./configure --prefix=$BB_MPICH_PREFIX
RUN make -j `nproc`
RUN make check
RUN make -j `nproc` install
