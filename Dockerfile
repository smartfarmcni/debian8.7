FROM debian:8.7
RUN apt-get update
RUN apt-get install -y build-essential qt5-default qt5-qmake cmake git curl bzip2 redis-server libpqxx-dev
RUN git clone --recursive https://github.com/Cylix/cpp_redis.git && cd cpp_redis && git submodule init && git submodule update && mkdir build && cd build && cmake .. && make && make install && cd .. && cd tacopie && cmake . && make install
