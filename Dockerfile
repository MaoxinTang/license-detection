################################################
# Choose one from below
FROM tensorflow/tensorflow:2.4.1-gpu-jupyter
################################################

ENV USER_NAME=np
ENV HOME="/home/local"


RUN apt-get -y update && apt-get install -y --no-install-recommends \
        cmake \
        unzip \
        yasm \
        pkg-config \
        vim \
        wget \
        nginx \
        libavcodec-dev \
        libavformat-dev \
        libavresample-dev \
        libswscale-dev \
        libv4l-dev \
        ca-certificates \
        libglib2.0-0 \
        libsm6 \
        libxext6 \
        libxrender1 \
        swig \
        git \
        gcc \
        ffmpeg \
        build-essential \
        libpq-dev \ 
        libxml2-dev \ 
        libxslt1-dev \ 
        libldap2-dev \ 
        libsasl2-dev \ 
        libffi-dev \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev \
        ca-certificates expat libgomp1 && \
        apt-get autoremove -y && \
        apt-get clean -y

# Update CUDA 11.0 to 11.1. Required to suppress error messages and resulting performance degrades, which reduce the speed by 60%.
RUN wget https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda_11.1.0_455.23.05_linux.run &&\
    sh cuda_11.1.0_455.23.05_linux.run --tar mxvf &&\
    cp $(find . -name 'ptxas') /usr/local/cuda/bin/ptxas &&\
    rm cuda_11.1.0_455.23.05_linux.run

 
#RUN pip uninstall -y enum34
RUN pip install sklearn pillow tqdm imgaug seaborn --upgrade

WORKDIR /home/local
ENTRYPOINT /bin/bash

