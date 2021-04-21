# Exploring Docker Slim with R Docker containers

This repository contains explorations of using the [Docker Slim](https://github.com/docker-slim/docker-slim) project to minify Docker containers wrapping the R language for statistical computing. In the R community, containerized workflows are now becoming an important part of computing environment reproducibility, and a step forward to leveraging better software development best practices.  The [Rocker](https://www.rocker-project.org/) project is considered the standard bearer for hosting robust Docker containers enabling many workflows and capabilities of R in data science. The examples used in this repository are largely inspired by the Rocker project.

## Development Notes

Here are the steps I followed to at least attempt minifying the Docker containers built from files in this repository

1. Install Docker on a standard Ubuntu 20.04 distribution from the standard Ubuntu repositories
1. [Install Docker Slim](https://github.com/docker-slim/docker-slim#installation) on host system
1. Build the R container in this repository: `docker build -t my/sample-r-container .`
1. Run Docker Slim to minify the container: `docker-slim build my/sample-r-container`

## Current status

The `docker-slim build` command above results in the following error:

```
eric@xps9300 ~/d/e/r_standard (r_examples)> docker-slim build my/sample-r-container
docker-slim: message='join the Gitter channel to ask questions or to share your feedback' info='https://gitter.im/docker-slim/community'
docker-slim: message='join the Discord server to ask questions or to share your feedback' info='https://discord.gg/9tDyxYS'
docker-slim: message='Github discussions' info='https://github.com/docker-slim/docker-slim/discussions'
cmd=build info=param.http.probe message='using default probe' 
cmd=build state=started
cmd=build info=params target='my/sample-r-container' continue.mode='probe' rt.as.user='true' keep.perms='true' 
cmd=build state=image.inspection.start
cmd=build info=image size.bytes='824638345' size.human='825 MB' id='sha256:b164e4a5c569b0328bc13fa6ba62881bad7252af25fce6b51d1495849abde99e' 
cmd=build info=image.stack index='0' name='ubuntu:20.04' id='sha256:26b77e58432b01665d7e876248c9056fa58bf4a7ab82576a024f5cf3dac146d6' 
cmd=build info=image.stack index='1' name='my/sample-r-container:latest' id='sha256:b164e4a5c569b0328bc13fa6ba62881bad7252af25fce6b51d1495849abde99e' 
cmd=build state=image.inspection.done
cmd=build state=container.inspection.start
cmd=build info=container status='created' name='dockerslimk_1277082_20210421003544' id='0fca9574e21b13c031f12dd5fe8816dc37e3277ca4a8a2e43c51799e22fa528a' 
cmd=build info=cmd.startmonitor status='sent' 
cmd=build info=event.startmonitor.done status='received' 
cmd=build info=container name='dockerslimk_1277082_20210421003544' id='0fca9574e21b13c031f12dd5fe8816dc37e3277ca4a8a2e43c51799e22fa528a' target.port.list='' target.port.info='' message='YOU CAN USE THESE PORTS TO INTERACT WITH THE CONTAINER' 
cmd=build state=http.probe.error error=no exposed ports message=expose your service port with --expose or disable HTTP probing with --http-probe=false if your containerized application doesnt expose any network services 
cmd=build state=exited code=33554435
docker-slim: message='join the Gitter channel to ask questions or to share your feedback' info='https://gitter.im/docker-slim/community'
docker-slim: message='join the Discord server to ask questions or to share your feedback' info='https://discord.gg/9tDyxYS'
docker-slim: message='Github discussions' info='https://github.com/docker-slim/docker-slim/discussions'
```

