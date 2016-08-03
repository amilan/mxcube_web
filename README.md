MXCuBE Docker container
=======================

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
To build the image you can clone this repository and run:
```
docker build -t mxcube_web .
```

  * Note: mxcube_web is just the name that you will give to your new image, feel free to change it if needed.

Running MXCuBE
--------------
OK, in this new version we are using supervisor to run the processes needed in background.
It's already configured in order that you only need to start the docker container and it will automatically start all the processes.
So, now you only need to run:
```
docker run -i -p 8090:8090 -t mxcube_web
```

After that, you can open a web browser and go the the url: localhost:8090.

And that's it. Have fun!


The previous old way is still valid, so you can follow it and do the following steps.

In order to run the container you can use one of the following options:
```
docker run -i -p 8090:8090 -t mxcube_web /bin/bash
```

And then you are inside the container. Now you only need to run:
```
run_mxcube
```

Now you can open your favourite web browser and go to this url:
localhost:8090

Last step: have fun using mxcube web!

Useful commands
---------------
Run your container with map forwarding and in detached mode:
```
docker run -d --name mxcube -p 8090:8090
```

List all the containers and remove the selected one
```
docker ps -a
docker rm <container_name>
```

TODO's
------
[] Volume mapping for data:
  - Maybe it's useful to have a mounted directory to save the mxcube logs in the host.
