FROM nvidia/cuda:7.5-cudnn3-devel-ubuntu14.04

RUN apt-get update && \
  apt-get install -y \
    build-essential \
    unzip \
    pkg-config \
    python-pip \
    python-dev \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    libpng-dev \
    libfreetype6-dev \
    libjpeg-dev \
    libhdf5-dev

ENV LIBRARY_PATH /usr/local/cuda-7.5/targets/x86_64-linux/lib/stubs

# install chainer
RUN pip install -U setuptools && \
  pip install -U pip

RUN pip install chainer==1.6.2.1 \
  Cython==0.23.4 \
  h5py==2.5.0

# clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install MNIST sample
WORKDIR /opt

RUN curl -L -O https://github.com/pfnet/chainer/archive/v1.6.2.tar.gz && \
  tar -xzf v1.6.2.tar.gz

WORKDIR /opt/chainer-1.6.2

# download the MNIST data to compare runtime
RUN python -c "execfile('examples/mnist/data.py'); load_mnist_data()"

# create and set entrypoint
COPY run-mnist.sh /opt/chainer-1.6.2
ENTRYPOINT ["./run-mnist.sh"]
