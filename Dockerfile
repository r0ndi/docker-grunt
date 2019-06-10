FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

RUN apt-get update && apt-get -y install
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8 && export LANG=en_US.UTF-8 && export LC_ALL=en_US.UTF-8
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install --no-install-recommends apt-utils \
    curl \
    gnupg \
    nodejs
RUN DEBIAN_FRONTEND=noninteractive npm install \
    grunt -g \
    grunt-cli -g

ADD run.sh /run.sh
RUN chmod 755 /run.sh
WORKDIR /project/

CMD ["/run.sh"]