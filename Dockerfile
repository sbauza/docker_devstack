FROM ubuntu
MAINTAINER Sylvain Bauza <sylvain.bauza@bull.net>

#set proxies
#RUN echo 'Acquire::http::Proxy "http://10.197.217.62:3128";' | tee -a /etc/apt/apt.conf
#ADD http_proxy.sh /etc/profile.d/http_proxy.sh
#RUN . /etc/profile.d/http_proxy.sh
#end set proxies

RUN apt-get update
RUN apt-get install -y git

RUN cd /opt && git clone https://github.com/openstack-dev/devstack 
