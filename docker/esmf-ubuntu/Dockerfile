FROM ubuntu:latest

ENV _DEBIAN_FRONTEND=$DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get --yes update && apt-get --yes upgrade
RUN apt-get --yes update && \
    apt-get --yes install build-essential gfortran wget git zlib1g-dev \
                          m4 libcurl4-gnutls-dev tree vim python3 python3-pip \
                          cmake curl libc6-dev mpich

RUN ln -fs /usr/bin/python3 /usr/bin/python
RUN ln -fs /usr/bin/pip3 /usr/bin/pip

RUN pip install numpy nose

ENV DEBIAN_FRONTEND=$_DEBIAN_FRONTEND
ENV _DEBIAN_FRONTEND=""
