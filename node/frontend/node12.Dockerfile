# Node v12.6
FROM node:12.6

RUN apt-get update && apt-get install -y sudo wget && apt-get clean
ENV LANG   C.UTF-8
ENV LC_ALL C.UTF-8
ENV PATH=./node_modules/.bin:$PATH

# Help propagate SIGTERM from host machine
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.0.0/dumb-init_1.0.0_amd64
RUN chmod +x /usr/local/bin/dumb-init

# Install YARN 
RUN npm install --global yarn

# Define entrypoint
ENTRYPOINT ["/usr/local/bin/dumb-init"]

# Expose ports.
EXPOSE 80
EXPOSE 443
EXPOSE 9876
