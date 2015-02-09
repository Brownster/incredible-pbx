#incredible pbx docker file
FROM phusion/baseimage:0.9.15
MAINTAINER marc brown <marc@22walker.co.uk> v1
 
RUN apt-get update \
  && cd /root \
  && wget http://incrediblepbx.com/incrediblepbx11.4.ubuntu14.tar.gz
  && tar zxvf incrediblepbx*
  && ./create-swapfile-DO
#  && ./Incredible*

ADD start.sh /root/
CMD bash -C '/root/start.sh';'bash'
