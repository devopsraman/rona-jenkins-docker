# Docker Container for Nexus


This is image for [jenkins][1] based on the image provided by the Jenkins project but
with the addition on docker.

## To Build

```
> docker build --tag jenkins-base . # normal build
> docker build --no-cache=true --force-rm=true --tag jenkins-base . # force a full build
```

## To Run

```
>  docker run --name="jenkins-server" -t -i \
              -p 8080:8080 \
              -v /var/run/docker.sock:/var/run/docker.sock \
              jenkins-base
```

[1]:  http://jenkins-ci.org/
