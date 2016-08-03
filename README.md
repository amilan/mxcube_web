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

How to use it
=============
If you want to use this container you have two possible ways:
1. Get the latest image from docker hub.
2. Clone the github repository and build your own image.


1. Run the container directly from docker hub
---------------------------------------------
You can run the official docker container executing the following commands:

```
docker run -i -p 8090:8090 -t amilan/mxcube_container
```
This will pull the official image from docker hub, create the container and run the services.


2. Building the image
---------------------
To build the image you can clone this repository:
```
git clone https://github.com/amilan/mxcube_container.git
```

And execute:
```
docker build -t mxcube_web .
```

  * Note: mxcube_web is just the name that you will give to your new image, feel free to change it if needed.

This will create a new image in your system called mxcube_web. Now you will be able to run containers using that image.

### Running MXCuBE

OK, now it's time to run the services. For this new version we are using supervisor in order to run the needed processes in background.
It's already configured and you only need to start the docker container, it will automatically start all services for you.
So, the next step is to run:
```
docker run -i -p 8090:8090 -t mxcube_web
```

After that, you can open a web browser and go the the url: localhost:8090.

And that's it. Have fun!

### Old way

The previous "old way" is still valid, so if you prefer you can follow this steps.

First, you must clone the repository and build the image as explained above.
After that, in order to run the container you can execute:
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
