#incredible pbx docker file
FROM phusion/baseimage:0.9.15
MAINTAINER marc brown <marc@22walker.co.uk> v0.1

# Set correct environment variables.
FROM phusion/baseimage:0.9.15
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV INCREDIBLE_PW pass123
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
 
RUN apt-get update && apt-get install wget build-essential \ 
 
#Add user
# grab gosu for easy step-down from root
RUN  useradd -r -incredible \
  && usermod --home /var/lib/asterisk incredible \
  && rm -rf /var/lib/apt/lists/* \
  && curl -o /usr/local/bin/gosu -SL 'https://github.com/tianon/gosu/releases/download/1.1/gosu' \
  && chmod +x /usr/local/bin/gosu \
  && apt-get purge -y

WORKDIR /root/
RUN wget http://incrediblepbx.com/incrediblepbx11guiU.tar.gz
  && tar zxvf incrediblepbx11guiU.tar.gz
  && rm -f incrediblepbx11guiU.tar.gz
  && ./IncrediblePBX11U-GUI.sh

ADD start.sh /root/
CMD bash -C '/root/start.sh';'bash'
