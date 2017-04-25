FROM debian:8.7
RUN apt-get update
RUN apt-get install -y gcc git curl bzip2 qt5-qmake redis-server libpqxx-dev qt5-default
