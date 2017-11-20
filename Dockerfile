FROM ubuntu:zesty

RUN apt-get -qq update && \
  DEBIAN_FRONTEND=noninteractive apt-get -qy --no-install-recommends install \
    liblzo2-dev \
    python-setuptools \
    python3-setuptools \
    curl \
    unzip \
    python-lzo \
    ca-certificates && \
  apt-get -qy clean autoclean autoremove && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN curl -sSL -o master.zip https://github.com/jrspruitt/ubi_reader/archive/master.zip && \
  unzip master.zip && \
  cd ubi_reader-master && \
  python setup.py install

VOLUME /firmware

WORKDIR /firmware

CMD ["/bin/bash"]