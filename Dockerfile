FROM concourse/concourse:latest

RUN echo "Install packages" \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y update \
  && apt-get -y install curl \

  && echo "Clean up" \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/* \

  && echo "Done"

ADD bin/start_concourse /usr/local/bin

ENTRYPOINT ["/usr/local/bin/dumb-init", "/usr/local/bin/start_concourse"]
