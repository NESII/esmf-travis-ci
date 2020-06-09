FROM bekozi/esmf-netcdf

ARG ESMF_BRANCH=""
RUN echo "ESMF_BRANCH=$ESMF_BRANCH"

# Build ESMF ==================================================================

ENV PATH=$PATH:$BB_MPICH_PREFIX/bin

WORKDIR ${HOME}/sandbox/esmf/src-git
RUN git clone --branch $ESMF_BRANCH --depth 1 https://github.com/esmf-org/esmf.git
WORKDIR esmf

ENV ESMF_DIR=${HOME}/sandbox/esmf/src-git/esmf
ENV ESMF_COMM=mpich3
ENV ESMF_BOPT="g"
ENV ESMF_NETCDF="split"
ENV ESMF_NETCDF_INCLUDE=${BB_NETCDFC_PREFIX}/include
ENV ESMF_NETCDF_LIBPATH=${BB_NETCDFC_PREFIX}/lib
ENV ESMF_INSTALL_PREFIX=${HOME}/sandbox/esmf/install
ENV ESMF_INSTALL_BINDIR=${ESMF_INSTALL_PREFIX}/bin
ENV ESMF_INSTALL_DOCDIR=${ESMF_INSTALL_PREFIX}/doc
ENV ESMF_INSTALL_HEADERDIR=${ESMF_INSTALL_PREFIX}/include
ENV ESMF_INSTALL_LIBDIR=${ESMF_INSTALL_PREFIX}/lib
ENV ESMF_INSTALL_MODDIR=${ESMF_INSTALL_PREFIX}/mod

#RUN make info 2>&1 | tee esmf-make-info.out
#RUN make 2>&1 | tee esmf-make.out
#RUN make check 2>&1 | tee esmf-make-check.out
#RUN make all_tests 2>&1 | tee esmf-make-all_tests.out
#RUN make install 2>&1 | tee esmf-make.out

# Build ESMPy =================================================================

ENV ESMFMKFILE=${ESMF_INSTALL_LIBDIR}/esmf.mk
WORKDIR ${ESMF_DIR}/src/addon/ESMPy
#RUN python setup.py build --ESMFMKFILE=${ESMFMKFILE}
#RUN python setup.py test 2>&1 | tee esmpy-test.out
#RUN python setup.py test_all 2>&1 | tee esmpy-test_all.out
#RUN python setup.py install
#RUN python -c "import ESMF"

WORKDIR ${ESMF_DIR}
