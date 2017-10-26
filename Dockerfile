FROM continuumio/anaconda

LABEL maintainer="ben.koziol@noaa.gov"

RUN conda config --set always_yes yes --set changeps1 no
RUN conda config --add channels conda-forge
RUN conda update -q --all
RUN conda install conda-build
RUN conda info -a

ENV DB_CONDA_PACKAGES "nose mpi4py netcdf4 ipython mpich"

RUN conda create -n esmf-py2.7 python=2.7 ${DB_CONDA_PACKAGES}

RUN conda create -n esmf-py3.6 python=3.6 ${DB_CONDA_PACKAGES}

COPY conda-recipes /tmp/conda-recipes
#WORKDIR /tmp/conda-recipes
#RUN hash -r
#RUN conda build esmf
#WORKDIR /esmf
