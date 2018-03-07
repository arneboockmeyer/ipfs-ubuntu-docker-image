FROM ubuntu:trusty
LABEL maintainer="Arne Boockmeyer <github@arneboockmeyer.de>"

# Install ipfs
RUN apt-get update -y
RUN apt-get install -y curl
RUN curl https://dist.ipfs.io/go-ipfs/v0.4.13/go-ipfs_v0.4.13_linux-amd64.tar.gz > ipfs.tar.gz
RUN tar xvfz ipfs.tar.gz
RUN cd go-ipfs && ./install.sh

# Expose ipfs ports
EXPOSE 4001
EXPOSE 4002/udp
EXPOSE 5001
EXPOSE 8080
EXPOSE 8081

# Create data directory
ENV IPFS_PATH=/data/ipfs
RUN mkdir -p /data/ipfs

# Start daemon as default command for the container
CMD ipfs daemon --init --migrate=true
