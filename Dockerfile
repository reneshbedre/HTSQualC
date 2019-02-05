# Dockerfile for RseqFilt container
# load ubuntu
FROM ubuntu:18.04

MAINTAINER Renesh Bedre (reneshbe@gmail.com)

# update and install essential modules
RUN apt-get update
RUN apt-get install -y git python3 python3-pip
RUN pip3 install --upgrade pip setuptools
RUN pip3 install numpy termcolor pysam datetime matplotlib

# set ENV variables and working directory
ENV BINP /usr/bin
ENV SRC /usr/src
RUN mkdir -p $SRC
WORKDIR $SRC

# clone and install RseqFilt
RUN git clone https://github.com/reneshbedre/RseqFilt.git
WORKDIR $SRC/RseqFilt
RUN python3 setup.py install

# execute filter.py command when container runs
ENTRYPOINT ["filter.py"]
