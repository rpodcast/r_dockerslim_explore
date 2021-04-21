# Exploring Docker Slim with R Docker containers

This repository contains explorations of using the [Docker Slim](https://github.com/docker-slim/docker-slim) project to minify Docker containers wrapping the R language for statistical computing. In the R community, containerized workflows are now becoming an important part of computing environment reproducibility, and a step forward to leveraging better software development best practices.  The [Rocker](https://www.rocker-project.org/) project is considered the standard bearer for hosting robust Docker containers enabling many workflows and capabilities of R in data science. The examples used in this repository are largely inspired by the Rocker project.

## Development Notes

Here are the steps I followed to at least attempt minifying the Docker containers built from files in this repository

1. Install Docker on a standard Ubuntu 20.04 distribution from the standard Ubuntu repositories
1. [Install Docker Slim](https://github.com/docker-slim/docker-slim#installation) on host system
1. Build the R container in this repository: `docker build -t my/sample-r-container .`
1. Run Docker Slim to minify the container: `docker-slim build i --http-probe=false my/sample-r-container`

## Current status

The `docker-slim build` command above is able to complete a build, although the user is prompted to hit ENTER to complete the process

```
eric@xps9300 ~/d/r_dockerslim_explore (main)> docker-slim build  --http-probe=false my/sample-r-container
docker-slim: message='join the Gitter channel to ask questions or to share your feedback' info='https://gitter.im/docker-slim/community'
docker-slim: message='join the Discord server to ask questions or to share your feedback' info='https://discord.gg/9tDyxYS'
docker-slim: message='Github discussions' info='https://github.com/docker-slim/docker-slim/discussions'
cmd=build info=exec message='changing continue-after from probe to enter because http-probe is disabled' 
cmd=build state=started
cmd=build info=params target='my/sample-r-container' continue.mode='enter' rt.as.user='true' keep.perms='true' 
cmd=build state=image.inspection.start
cmd=build info=image id='sha256:b164e4a5c569b0328bc13fa6ba62881bad7252af25fce6b51d1495849abde99e' size.bytes='824638345' size.human='825 MB' 
cmd=build info=image.stack index='0' name='ubuntu:20.04' id='sha256:26b77e58432b01665d7e876248c9056fa58bf4a7ab82576a024f5cf3dac146d6' 
cmd=build info=image.stack index='1' name='my/sample-r-container:latest' id='sha256:b164e4a5c569b0328bc13fa6ba62881bad7252af25fce6b51d1495849abde99e' 
cmd=build state=image.inspection.done
cmd=build state=container.inspection.start
cmd=build info=container id='c780e711c3e90241d8776bae1c45e9d8f0e02ac410c5ecdcfc905a9cecaf1ebf' status='created' name='dockerslimk_1355061_20210421031252' 
time="2021-04-20T23:12:53-04:00" level=error msg="channel.Client.Read: read error (read tcp 127.0.0.1:47762->127.0.0.1:32776: read: connection reset by peer), exiting..."
time="2021-04-20T23:12:53-04:00" level=error msg="channel.NewCommandClient: channel verify error = read tcp 127.0.0.1:47762->127.0.0.1:32776: read: connection reset by peer"
cmd=build info=cmd.startmonitor status='sent' 
cmd=build info=event.startmonitor.done status='received' 
cmd=build info=container target.port.info='' message='YOU CAN USE THESE PORTS TO INTERACT WITH THE CONTAINER' name='dockerslimk_1355061_20210421031252' id='c780e711c3e90241d8776bae1c45e9d8f0e02ac410c5ecdcfc905a9cecaf1ebf' target.port.list='' 
cmd=build info=continue.after mode='enter' message='provide the expected input to allow the container inspector to continue its execution' 
cmd=build prompt='USER INPUT REQUIRED, PRESS <ENTER> WHEN YOU ARE DONE USING THE CONTAINER'

cmd=build state=container.inspection.finishing
cmd=build state=container.inspection.artifact.processing
cmd=build state=container.inspection.done
cmd=build state=building message=building optimized image 
cmd=build state=completed
cmd=build info=results status='MINIFIED' by='7.23X' size.original='825 MB' size.optimized='114 MB' 
cmd=build info=results image.name='my/sample-r-container.slim' image.size='114 MB' has.data='true' 
cmd=build info=results artifacts.location='/home/eric/bin/.docker-slim-state/images/b164e4a5c569b0328bc13fa6ba62881bad7252af25fce6b51d1495849abde99e/artifacts' 
cmd=build info=results artifacts.report='creport.json' 
cmd=build info=results artifacts.dockerfile.reversed='Dockerfile.fat' 
cmd=build info=results artifacts.dockerfile.optimized='Dockerfile' 
cmd=build info=results artifacts.seccomp='my-sample-r-container-seccomp.json' 
cmd=build info=results artifacts.apparmor='my-sample-r-container-apparmor-profile' 
cmd=build state=done
cmd=build info=commands message='use the xray command to learn more about the optimize image' 
cmd=build info=report file='slim.report.json' 
docker-slim: message='join the Gitter channel to ask questions or to share your feedback' info='https://gitter.im/docker-slim/community'
docker-slim: message='join the Discord server to ask questions or to share your feedback' info='https://discord.gg/9tDyxYS'
docker-slim: message='Github discussions' info='https://github.com/docker-slim/docker-slim/discussions'
```
