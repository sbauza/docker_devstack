FROM ubuntu
MAINTAINER Sylvain Bauza <sylvain.bauza@bull.net>

#set proxies
RUN echo 'Acquire::http::Proxy "http://10.197.217.62:3128";' | tee -a /etc/apt/apt.conf
ADD http_proxy.sh /etc/profile.d/http_proxy.sh
RUN . /etc/profile.d/http_proxy.sh
ENV http_proxy http://10.197.217.62:3128
ENV https_proxy http://10.197.217.62:3128
#end set proxies

RUN apt-get update
RUN apt-get install -y --force-yes git

RUN cd /opt && git clone https://github.com/openstack-dev/devstack 
ADD localrc /opt/devstack/
RUN echo "HOST_IP=$(ip a show eth0 | awk '$1 == "inet" {split ($2,a,"/"); print a[1]}')" >> /opt/devstack/localrc
RUN /opt/devstack/tools/create-stack-user.sh
USER stack
RUN id && /opt/devstack/stack.sh

