FROM ubuntu:bionic

RUN apt-get update && apt-get install -y \
  build-essential \
  libboost-all-dev \
  libssl-dev

RUN useradd -ms /bin/bash seeder

WORKDIR /app

RUN chown -R seeder:seeder /app

USER seeder

COPY Makefile *.cpp *.h ./

RUN make

CMD ["./dnsseed"]

ENTRYPOINT [ "/tini", "--" ]
