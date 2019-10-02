FROM bekozi/esmf-netcdf

# Build ESMF =================================================================================================

WORKDIR ${HOME}/sandbox/esmf/git
RUN git clone --depth 1 https://git.code.sf.net/p/esmf/esmf esmf
WORKDIR esmf
RUN git checkout master

ENV ESMF_DIR=${HOME}/sandbox/esmf/git/esmf
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

RUN make info 2>&1 | tee esmf-make-info.out
RUN make 2>&1 | tee esmf-make.out
RUN make check 2>&1 | tee esmf-make-check.out
#RUN make all_tests 2>&1 | tee esmf-make-all_tests.out
RUN make install 2>&1 | tee esmf-make.out

# Build ESMPy ================================================================================================

RUN apt-get --yes install python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install numpy nose

ENV ESMFMKFILE=${ESMF_INSTALL_LIBDIR}/esmf.mk
WORKDIR ${ESMF_DIR}/src/addon/ESMPy
RUN python setup.py build --ESMFMKFILE=${ESMFMKFILE}
RUN python setup.py test 2>&1 | tee esmpy-test.out
RUN python setup.py install
RUN python -c "import ESMF"
