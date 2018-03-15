# Build as: docker build -t kariusdx/py-dev .
FROM python:3.6-slim
RUN apt-get update \
 && apt-get install -y gcc \
 && apt-get clean \
 && pip3 install --upgrade pip \
 && pip3 install mypy==0.570 flake8==3.5.0 flake8-per-file-ignores
