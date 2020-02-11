FROM ubuntu:latest

RUN apt-get --yes update && apt-get --yes upgrade
RUN apt-get --yes update && \
    apt-get --yes install build-essential gfortran wget git zlib1g-dev \
                          m4 libcurl4-gnutls-dev tree vim python3 python3-pip \
                          cmake curl libc6-dev

RUN ln -fs /usr/bin/python3 /usr/bin/python
RUN ln -fs /usr/bin/pip3 /usr/bin/pip

RUN pip install numpy nose
