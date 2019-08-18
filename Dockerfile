FROM ubuntu

RUN apt-get update && \
    apt-get install -y rsync git && \
    apt-get clean

WORKDIR /root

COPY ./ /root/

