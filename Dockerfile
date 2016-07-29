##############################################################################
# Dockerfile to run MXCuBE web server
##############################################################################

FROM centos:7
MAINTAINER Antonio Milan Otero <antonio.milan_otero.maxiv.lu.se>

# Install #### 
RUN yum install -y curl
RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -

RUN yum install -y gcc-c++ make
# or: yum groupinstall 'Development Tools'

# Install nodejs from epel repository ####
RUN yum install -y nodejs npm

# Check nodejs version ####
# RUN node --version

# Install npm ####
# RUN yum install -y npm

# Install more dependencies ####
RUN yum install -y \
        python-devel \
        openldap-devel \
        lapack-devel \
        zlib-devel \
        libjpeg-turbo-devel \
        libxml2-devel \
        libxslt-devel \
        openssl-devel \
        libgfortran \
        cyrus-sasl-devel

# Install git ####
RUN yum install -y git

# Get MxCUBE code ####
RUN mkdir /mxcube
WORKDIR /mxcube
RUN git clone https://github.com/mxcube/mxcube3.git --recursive
WORKDIR mxcube3
# RUN git submodule init; git submodule update

# Install EPEL repository ####
RUN yum install -y epel-release
RUN yum makecache # && yum update -y

# Install python pip ####
RUN yum install -y python-pip
RUN yum install -y redis

# Install requirements ####
RUN pip install -r requirements.txt

# Install npm ####
RUN npm install
RUN npm install fabric
RUN npm install --dev

RUN cp backend_server.js.example backend_server.js

#COPY docker-entrypoint.sh /usr/local/bin/
#ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 8090 8081

# WORKDIR /mxcube/mxcube3
# CMD python mxcube3-server -r test/HardwareObjectsMockup.xml --log-file mxcube.log
# CMD ["python", "mxcube3-server", "-r", "/mxcube/mxcube3/test/HardwareObjectsMockup.xml", "--log-file", "/mxcube/mxcube3/mxcube.log", ";npm start"]

