FROM debian:bookworm
LABEL org.opencontainers.image.source https://github.com/roboticsoutreach/uffd-docker

RUN apt update && apt install -y \
    python3 \
    python3-flask \
    python3-flask-sqlalchemy \
    python3-flask-migrate \
    python3-qrcode \
    python3-jwt \
    python3-cryptography \
    python3-flask-babel \
    python3-argon2 \
    python3-itsdangerous \
    python3-mysqldb \
    python3-ua-parser \
    python3-fido2 \
    python3-oauthlib

COPY uffd/ /uffd

WORKDIR /uffd

ENV FLASK_APP=uffd
CMD flask db upgrade && flask run --host=0.0.0.0
