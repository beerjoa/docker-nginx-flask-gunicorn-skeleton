# docker-nginx-flask-gunicorn-skeleton

[![Build Status](https://travis-ci.com/beerjoa/docker-nginx-flask-gunicorn-skeleton.svg?branch=master)](https://travis-ci.com/beerjoa/docker-nginx-flask-gunicorn-skeleton)

##### [status code WIKI](https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C#3xx_(%EB%A6%AC%EB%8B%A4%EC%9D%B4%EB%A0%89%EC%85%98_%EC%99%84%EB%A3%8C))
##### [flask restplus error handling](https://flask-restplus.readthedocs.io/en/stable/errors.html)


<br>

*Make sure you have docker and docker-compose installed beforehand*

<br>

## INSTALL
<br>

### 1. Set docker image for running app 

pull default images
- [nginx:stable](https://hub.docker.com/_/nginx)
- [centos/python-38-centos7](https://hub.docker.com/r/centos/python-38-centos7)
```bash
$ make pull_image
```

make 'requirements.txt' file in the same path with Dockerfile
(we use './docker-image' in here) and then build an image for your server.

```bash
$ make build_image name={image_name} tag={image_tag}
```

<br>

### 2. Fix docker-compose.yml file

fix a image-name in the 'docker-compose.yml' file with the image that you made before.
    
in docker-compose.yml:
```yaml
services:
    app1:
        ...
        image: {image_name}: {image_tag}
        ...
```

<br>

## TEST

- Don't need to run 'pull_image' and 'build_image' above. \
It will make temp docker image for testing and remove temp image after testing
```bash
$ make test_all
```


- Should make own images with 'pull_image' and 'build_image' before running this command.
```bash
$ make test_app
```

<br>

## RUN

- Should make own images with 'pull_image' and 'build_image' before running this.
```bash
$ make run
```

<br>


## USAGE


### 1. flask app

- [flask-restplus-skeleton](https://github.com/beerjoa/flask-restplus-skeleton)

- [gunicorn settings.config docs](https://docs.gunicorn.org/en/stable/settings.html#config-file)


### 2. docker
<!-- you can make a new docker image and manage it -->
<br>

### 3. nginx
<br>

