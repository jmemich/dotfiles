# UTF-8 env
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-82

# disable stdin
export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y software-properties-common

# get some basics
sudo apt-get update -y && sudo apt-get install -y \
    vim \
    tmux \
    make \
    automake \
    libpq-dev \
    python-dev \
    gfortran \
    git \
    wget \
    g++ \
    libyaml-dev \
    libcurl4-openssl-dev \
    libhdf5-7 \
    libhdf5-dev \
    libboost-program-options-dev \
    ca-certificates \
    curl \
    libnlopt-dev \
    libffi-dev \
    libtool \
    libxrender1 \
    libxml2-dev \
    libfreetype6 \
    libfreetype6-dev \
    libpng12-dev

# TODO deal with postgresql!

# conda install
# move to Vagrantfile so idempotent!
echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.0.5-Linux-x86_64.sh
/bin/bash Miniconda3-4.0.5-Linux-x86_64.sh -b -p /opt/conda
rm Miniconda3-4.0.5-Linux-x86_64.sh
/opt/conda/bin/conda install --yes conda==4.0.5
