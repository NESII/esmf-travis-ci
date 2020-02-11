FROM bekozi/esmf

RUN apt-get -y update && apt-get -y install subversion csh
WORKDIR ${BB_SANDBOX}/esmfcontrib/src-svn
RUN svn checkout svn://svn.code.sf.net/p/esmfcontrib/svn/ esmfcontrib-svn
WORKDIR esmfcontrib-svn

WORKDIR NUOPC/trunk
#WORKDIR NUOPC/branches/info-json-dev
RUN ln -s /usr/bin/make /usr/bin/gmake
RUN bash testProtos.sh 2>&1 | tee testProtos.out
