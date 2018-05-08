FROM ubuntu:latest

RUN apt-get update && apt-get install -y build-essential libc6-dev-i386 curl less vim

RUN mkdir -p /usr/src

WORKDIR /root

RUN curl -L https://software-lab.de/picoLisp-17.12.tgz -o picoLisp.tgz

RUN tar xzvf ./picoLisp.tgz
RUN cp -R /root/picoLisp /usr/src/

WORKDIR /usr/src/picoLisp

RUN make -C src \
&&  mv    /usr/src/picoLisp /usr/lib/picolisp \
&&  ln -s /usr/lib/picolisp/bin/picolisp /usr/bin \
&&  ln -s /usr/lib/picolisp/bin/pil /usr/bin

RUN useradd -ms /bin/bash pico

RUN chown -R pico:pico /usr/lib/picolisp

USER pico

WORKDIR /home/pico

# See https://gist.github.com/semperos/3cf84791caa304bf2be69f5d5d81c05e
RUN curl -L -o /home/pico/README.md https://gist.githubusercontent.com/semperos/d62d9c08a3a5195a4ea997c7509ca430/raw/fbd20f15a7fa8740c5bab6f474c6e38376c426b3/picolisp-docker-README.md

EXPOSE 8080
