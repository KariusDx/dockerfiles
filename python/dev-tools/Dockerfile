# Build as: docker build -t kariusdx/py-dev .
FROM python:3.5-slim
RUN apt-get update \
 && apt-get install -y gcc \
 && apt-get clean \
 && pip3 install mypy-lang==0.4.5 typed-ast==0.6.1 flake8==2.5.4
