# FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn9-runtime
FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn9-devel

LABEL authors="Colby T. Ford <colby@tuple.xyz>"

## Install system requirements
RUN apt update && \
    apt-get install -y --reinstall \
        ca-certificates \
        make && \
    apt install -y \
        build-essential \
        git \
        wget \
        gcc \
        g++

## Set working directory
RUN mkdir -p /software/evo2
WORKDIR /software/evo2

## Clone project
RUN git clone --recurse-submodules https://github.com/ArcInstitute/evo2.git /software/evo2

## Install dependencies and Evo2
ENV CUDA_HOME=/usr/local/cuda
# RUN conda install -c conda-forge cudatoolkit-dev -y
RUN pip install .
