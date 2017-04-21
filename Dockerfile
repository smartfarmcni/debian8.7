FROM debian:8
RUN apt update
RUN apt install -y gcc redis-server git curl bzip2

