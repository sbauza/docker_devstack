FROM ubuntu
MAINTAINER Sylvain Bauza <sylvain.bauza@bull.net>

#set proxies
RUN echo 'Acquire::http::Proxy "http://10.197.217.62:3128";' | tee -a /etc/apt/apt.conf
RUN echo 'http_proxy="http://10.197.217.62:3128"' > /etc/profile.d/http_proxy.sh
RUN echo 'https_proxy="http://10.197.217.62:3128"' >> /etc/profile.d/http_proxy.sh
RUN echo 'ENV no_proxy="127.0.0.1"' >> /etc/profile.d/http_proxy.sh
RUN source /etc/profile.d/http_proxy.sh
#end set proxies

RUN apt-get update
RUN apt-get install -y git

RUN cd /opt && git clone https://github.com/openstack-dev/devstack 
