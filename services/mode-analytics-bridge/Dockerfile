FROM ubuntu:16.04

RUN apt-get update; \
 apt-get -y install curl; \
 apt-get clean;

RUN curl -L https://packagecloud.io/install/repositories/modeanalytics/main/script.deb.sh | bash; \
 apt-get update; \
 apt-get -y install mode-bridge; \
 rm -rf /var/lib/apt/lists/*;

CMD ["/opt/mode/bridge/bin/mode-bridge"]