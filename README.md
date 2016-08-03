MXCuBE Docker container
=======================

Warning
-------
This branch is under development and it's not working yet. It's possible to make it work with ugly workarounds.

Introduction
------------
This is a first implementation of a docker container which is able to run
the MXCuBE web application.

It's based on a centOS 7 image and has been built following the procedure
listed in MXCuBE web's wiki:
 https://github.com/mxcube/mxcube3/wiki/How-to:-Installation

Installing Docker
-----------------
You can find more information about Docker installation here:
 https://docs.docker.com/

Building the image
------------------
This branch is using docker-compose. That means that everything you need to do is clone the repo and execute:
```
docker-compose build
docker-compose up
```

You can still use the docker commands as explained below in the deprecated info.


Deprecated info
===============

Usage without docker-compose
----------------------------
* Clone the repository and from master branch do:
  - Build the image:
```
  > docker build -t mxcube_web .
```

  - Launch the container with the following command:
```
  > docker run -i -p 8090:8090 -t mxcube_web /bin/bash
```

  - Inside the container run:
```
  > run_mxcube
```

* Clone the repository and from use_composer branch do:
  - Build the image:
```
  > docker-compose build
```

  - Launch docker composer:
```
  > docker-compose up
```

    * This is not working yet.


TODO's
======
[] FIX docker-compose up.
    - links are not working. Mxcube container cannot connect to redis container.



Useful docker commands
----------------------
Run your container with map forwarding
```
docker run -d --name mxcube -p 8090:8090
```

List all the containers and remove the selected one
```
docker ps -a
docker rm <container_name>

docker run -i -p 8090:8090 -t mxcube_web python mxcube3-server -r test/HardwareObjectsMockup.xml --log-file mxcube.log
```
