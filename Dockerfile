FROM debian:jessie
# RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get install -y \
    git \
    python \
    vim

CMD ["echo", "Hello World"]


