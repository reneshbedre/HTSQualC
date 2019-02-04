# Dockerfile for rseqfilt image
# Alpine Linux with a complete package index
FROM alpine:3.8

MAINTAINER Renesh Bedre (reneshbe@gmail.com)

# update and install essential modules
RUN apk add --no-cache git python3
RUN pip3 install --upgrade pip setuptools
RUN pip3 install numpy termcolor pysam datetime matplotlib

ADD filter.py /

# Run app.py when the container launches
CMD ["python3", "filter.py"]

