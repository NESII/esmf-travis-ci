FROM ubuntu:18.04

ENV _DEBIAN_FRONTEND=$DEBIAN_FRONTEND
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/Denver /etc/localtime
RUN apt-get -y update && apt-get -y install texlive latex2html perl csh git build-essential zip
RUN apt-get -y install gfortran
ENV DEBIAN_FRONTEND=$_DEBIAN_FRONTEND
ENV _DEBIAN_FRONTEND=""
