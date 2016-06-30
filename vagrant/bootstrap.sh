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

# conda install
if hash conda 2>/dev/null; then
    echo "conda is already installed!"
else
    echo 'export PATH=/home/vagrant/miniconda3/bin:$PATH' > /home/vagrant/.bashrc
    sudo wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.0.5-Linux-x86_64.sh
    /bin/bash Miniconda3-4.0.5-Linux-x86_64.sh -b -p /home/vagrant/miniconda3
    sudo rm Miniconda3-4.0.5-Linux-x86_64.sh
    /home/vagrant/miniconda3/bin/conda install --yes conda==4.0.5
fi
