FROM python:3.6

RUN apt update && apt -y install ca-certificates build-essential autoconf && \
    cd /tmp && \
    wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.0/protobuf-cpp-3.6.0.tar.gz && \
    tar zxvf protobuf-cpp-3.6.0.tar.gz && \
    cd protobuf-3.6.0 && \
    ./autogen.sh && \
    ./configure --prefix=/usr/ && \
    make -j32 && make install && \
    cd .. && rm -rf protobuf-3.6.0 && rm protobuf-cpp-3.6.0.tar.gz
