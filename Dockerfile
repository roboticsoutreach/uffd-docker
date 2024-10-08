FROM debian:bookworm

RUN apt update && apt install -y ca-certificates

RUN echo "deb https://packages.cccv.de/uffd bookworm main" > /etc/apt/sources.list
COPY cccv-archive-key.gpg /etc/apt/trusted.gpg.d/cccv-archive-key.gpg

RUN apt update && apt install -y uffd
