FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

RUN apt-get update \
    && apt-get install -y \
    curl \
    gnupg \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g grunt \
    && npm install -g grunt-cli

ADD run.sh /run.sh
RUN chmod 755 /run.sh
WORKDIR /project/

CMD ["/run.sh"]