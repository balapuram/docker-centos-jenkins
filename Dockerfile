FROM balapuram/centos-base:centos7

MAINTAINER Bhaskar Balapuram 
#Installing reqeired tools for CI Container.
RUN yum -y install wget git tar python-pip
RUN pip install databricks-cli
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
#Jenkins setup
RUN yum -y install \
  java-1.8.0-openjdk \
  jenkins
#Docker setup
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install docker-ce -y
#SBT setup
WORKDIR /app
RUN wget https://piccolo.link/sbt-1.2.3.tgz \
 && gunzip sbt-1.2.3.tgz \
 && tar -xvf sbt-1.2.3.tar \
 && rm -rf sbt-1.2.3.tar 
#S2I setup
RUN wget https://github.com/openshift/source-to-image/releases/download/v1.1.13/source-to-image-v1.1.13-b54d75d3-linux-amd64.tar.gz \
 && gunzip source-to-image-v1.1.13-b54d75d3-linux-amd64.tar.gz \
 && tar -xvf source-to-image-v1.1.13-b54d75d3-linux-amd64.tar \
 && rm -rf source-to-image-v1.1.13-b54d75d3-linux-amd64.tar
RUN chmod -R 777 /app
# Clean up YUM when done.
RUN yum clean all
ADD scripts /scripts
RUN chmod +x /scripts/start.sh
RUN touch /first_run

ADD etc/jenkins /etc/init.d/jenkins
RUN chmod +x /etc/init.d/jenkins
EXPOSE 8080 22
VOLUME ["/run", "/var/lib/jenkins", "/var/log" "/var/cache/jenkins/war"]
# Starting jenkins
CMD ["/scripts/start.sh"]
