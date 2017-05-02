FROM debian:8.7

ADD ./environment.yml .

RUN apt-get update
RUN apt-get install -y libopenblas-base libboost-python-dev libsuperlu4
RUN apt-get install -y build-essential gfortran qttools5-dev qt5-default cmake git curl bzip2 redis-server libpqxx-dev libboost-test-dev # libsuperlu-dev
RUN apt-get install -y libyaml-cpp-dev libboost-dev libblas-dev liblapack-dev
RUN git clone --recursive https://github.com/Cylix/cpp_redis.git && cd cpp_redis && git submodule init && git submodule update && mkdir build && cd build && cmake .. && make && make install && cd .. && cd tacopie && cmake . && make install
RUN curl --silent -o miniconda-installer.sh https://repo.continuum.io/miniconda/Miniconda3-4.3.11-Linux-x86_64.sh && bash miniconda-installer.sh -b -p $HOME/anaconda3  && echo 'export PATH="$HOME/anaconda3/bin:$PATH"' >> /root/.bashrc
RUN $HOME/anaconda3/bin/conda env create
