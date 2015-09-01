#incredible pbx docker file
FROM phusion/baseimage:0.9.17
MAINTAINER marc brown <marc@22walker.co.uk> v0.1
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV INCREDIBLE_PW pass123
ENV INCREDIBLE_USER incredible
CMD ["/sbin/my_init"]
EXPOSE 10000-20000/udp
Expose 5060/udp
Expose 80
Expose 8088
WORKDIR /root/
RUN apt-get update && apt-get install -y wget build-essential ssh python
 
#Add user
RUN groupadd -r $INCREDIBLE_USER \
  && useradd -r -g $INCREDIBLE_USER $INCREDIBLE_USER \
  && echo $INCREDIBLE_USER:$INCREDIBLE_PW | chpasswd \
  && usermod --home /var/lib/asterisk incredible \
  && rm -rf /var/lib/apt/lists/* \
#SSH adjustments  
  && sed -i 's|without-password|yes|' /etc/ssh/sshd_config \
  && sed -i 's|yes"|without-password"|' /etc/ssh/sshd_config \
#  && sed -i 's|"quiet"|"quiet text"|' /etc/default/grub \
#  && update-grub \
  
#Install Incredible PBX
  && apt-get purge -y \
  && wget http://incrediblepbx.com/incrediblepbx11.4.ubuntu14.tar.gz \
  && tar zxvf incrediblepbx* \
  && ./Incredible*

# ADD start.sh /root/
CMD incredible -f
