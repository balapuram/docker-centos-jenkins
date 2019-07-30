 # Jenkins as a Container
 
## CentOS-Docker-Jenkins

A Dockerfile that produces a CentOS-based Docker image that will run the latest stable [Jenkins][jenkins].

The build is based on [docker.io/balapuram/centos-base][docker-centos-base].

[Jenkins]: http://jenkins-ci.org/

## Included packages (and their dependencies)

* Jenkins
* OpenJDK 1.8
* Docker
* cqlsh
* sbt
* sonar-scannar

## Image Creation

This example creates the image with the tag `balapuram/dal_jenkins`, but you can
change this to use your own username.

```
$  docker build -t balapuram/dal_jenkins:1 .
```

## Container Creation / Running

docker run  -it -d -p 8080:8080 -v Jenkins_home:/var/lib/jenkins -v /var/run/docker.sock:/var/run/docker.sock balapuram/dal_jenkins:1


## Accessing Jenkins Web UI

http://<host ip>:8080
Start creating projects.!!

Please dorp a note if you would like to talk to me in this regard.

balapuram.b@gmail.com
