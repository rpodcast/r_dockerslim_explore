# Exploring Docker Slim with R Docker containers

This repository contains explorations of using the [Docker Slim](https://github.com/docker-slim/docker-slim) project to minify Docker containers wrapping the R language for statistical computing. In the R community, containerized workflows are now becoming an important part of computing environment reproducibility, and a step forward to leveraging better software development best practices.  The [Rocker](https://www.rocker-project.org/) project is considered the standard bearer for hosting robust Docker containers enabling many workflows and capabilities of R in data science. The example in this repository is a Shiny web application, which operates in a similar fashioin as a Python Flask or Dash application.

Fun fact: This application has been used in Martin's Linux gaming streams to help select a car at random for HotShot Racing league competitions!

## Development Notes

Here are the steps I followed to at least attempt minifying the Docker containers built from files in this repository

1. Install Docker on a standard Ubuntu 20.04 distribution from the standard Ubuntu repositories
1. [Install Docker Slim](https://github.com/docker-slim/docker-slim#installation) on host system
1. Build the R container in this repository: `docker build -t my/sample-shiny-app .`
1. Verify that the Shiny application renders correctly by visiting `localhost:7123` in your browser after running the container: `docker run -it --rm -p 7123:80 my/sample-shiny-app` 
1. Run Docker Slim to minify the container: `docker-slim build my/sample-shiny-app`
1. Verify that the Shiny application renders correctly in the slimmed container by visiting `localhost:7123` in your browser after running the container: `docker run -it --rm -p 7123:80 my/sample-shiny-app.slim` 

## Current status

The `docker-slim build` command above is able to complete a build. However, the container cannot be run correctly. The error I receive is below:

```
eric@xps9300 ~/s/hotshots.random (main)> docker run -it --rm -p 7123:80 my/sample-shiny-app.slim
standard_init_linux.go:219: exec user process caused: no such file or directory
```

