# Docker YOURLS 
A Dockerfile installing [YOURLS](https://github.com/YOURLS/YOURLS) running on Apache 2.4 from source. Built on Alpine Linux.

[![Docker Stars](https://img.shields.io/docker/stars/alfg/YOURLS.svg)](https://hub.docker.com/r/alfg/YOURLS/)
[![Docker Pulls](https://img.shields.io/docker/pulls/alfg/YOURLS.svg)](https://hub.docker.com/r/alfg/YOURLS/)
[![Docker Automated build](https://img.shields.io/docker/automated/alfg/YOURLS.svg)](https://hub.docker.com/r/alfg/YOURLS/builds/)
[![Build Status](https://travis-ci.org/alfg/docker-YOURLS.svg?branch=master)](https://travis-ci.org/alfg/docker-YOURLS)

## Usage

* Pull docker image and run:
```
docker pull alfg/YOURLS
docker run -d -p 8080:80 --rm alfg/YOURLS
```
* or build and run container from source:
```
docker build -t YOURLS
docker run -d -p 8080:80 --rm YOURLS
```

* or build using `docker-compose`:
```
docker-compose build
docker-compose up
```

This should bring up the app and database image.

* Log into the admin in a browser at: `http://localhost:8080/admin` to setup the database and create a short url:
    * `USERNAME`: username
    * `PASSWORD`: password

_**Please note**, you should update your username and password in the config._

* Create a shorturl and test:
```
curl -i http://localhost:8080/<keyword>
```


## Configure
It is highly recommended to configure the options defined in [src/config.php](src/config.php) to setup your domain, connection and security settings.

See [https://yourls.org/#Config](https://yourls.org/#Config) for reference.

---

Apache HTTPD default configurations are included in the [etc](/etc) directory. You can override the configurations and these will be copied over into the container.

Also see [etc/httpd/sites/](/etc/httpd/sites) for adding or editing virtual hosts.

## Resources
* https://github.com/YOURLS/YOURLS
* https://github.com/YOURLS/YOURLS/wiki
* https://yourls.org/#Config
* http://httpd.apache.org/docs/2.4/install.html

## License
MIT