FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

RUN apt-get update \
    && apt-get install -y \
    curl \
    gnupg \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && npm i \
    && npm install grunt \
    && npm install grunt-cli \
    && npm install grunt-sass \
    && npm install grunt-contrib-uglify-es

ADD run.sh /run.sh
RUN chmod 755 /run.sh
WORKDIR /project/
RUN npm i

CMD ["/run.sh"]