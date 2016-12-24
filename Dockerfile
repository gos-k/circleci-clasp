FROM ubuntu:14.04
MAINTAINER gos-k

RUN apt-get update
RUN apt-get install git clang-3.6 clang-3.6-dev llvm-3.6 llvm-3.6-dev libboost-dev libboost-filesystem-dev libboost-date-time-dev libboost-serialization-dev libboost-iostreams-dev libboost-program-options-dev libboost-random-dev libboost-regex-dev libboost-system-dev libgmp-dev autoconf automake libtool libexpat-dev libz-dev libncurses-dev libreadline-dev libedit-dev sbcl make -y 
RUN apt-get autoremove -y && apt-get clean -y
RUN git clone https://github.com/drmeister/clasp.git
WORKDIR clasp
RUN git tag && git checkout 0.4.0 && PJOBS=1 make

CMD clasp/build/clasp/Contents/execs/boehm/release/bin/clasp --version
