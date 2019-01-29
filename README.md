# docker-centos-jenkins

A Dockerfile that produces a CentOS-based Docker image that will run the latest stable [Jenkins][jenkins].

The build is based on [docker.io/balapuram/centos-base][docker-centos-base].

[Jenkins]: http://jenkins-ci.org/

## Included packages (and their dependencies)

* Jenkins
* OpenJDK 1.8

## Image Creation

This example creates the image with the tag `balapuram/dal_jenkins`, but you can
change this to use your own username.

```
$  docker build -t balapuram/dal_jenkins:1 .
```

Alternately, you can run the following if you have *GNU Make* installed...

## Container Creation / Running

docker run  -it -d --privileged -p 8080:8080 -v Akka_stream:/var/lib/jenkins -v /var/run/docker.sock:/var/run/docker.sock balapuram/dal_jenkins:1

