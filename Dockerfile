FROM balapuram/centos-base:centos7

#MAINTAINER Bhaskar Balapuram <bbalapuram@sapient.com>
#Installing reqeired tools for CI Container.
RUN yum -y install wget git tar python-pip
RUN pip install databricks-cli
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

RUN yum -y install \
  java-1.8.0-openjdk \
  jenkins

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install docker-ce -y

# Clean up YUM when done.
RUN yum clean all

ADD scripts /scripts
RUN chmod +x /scripts/start.sh
RUN touch /first_run

# The --deaemon removed from the init file.
ADD etc/jenkins /etc/init.d/jenkins
RUN chmod +x /etc/init.d/jenkins

EXPOSE 8080 22

VOLUME ["/run", "/var/lib/jenkins", "/var/log" "/var/cache/jenkins/war"]

# Starting jenkins
CMD ["/scripts/start.sh"]
