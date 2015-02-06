#incredible pbx docker file for unraid 6
FROM phusion/baseimage:0.9.15
MAINTAINER marc brown <marc@22walker.co.uk> v1
 
RUN apt-get update

ADD start.sh /root/
CMD bash -C '/root/start.sh';'bash'
