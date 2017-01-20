# Build as: docker build -t kariusdx/py-dev .
FROM python:3.5-slim
RUN apt-get update \
 && apt-get install -y gcc \
 && apt-get clean \
 && pip3 install --upgrade pip \
 && pip3 install mypy==0.470 flake8==2.5.4 flake8-putty==0.4.0
