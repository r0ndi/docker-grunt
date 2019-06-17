FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

RUN apt-get update \
    && apt-get install -y \
    curl \
    gnupg \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y nodejs \
    && npm install grunt \
    && npm install grunt-cli \
    && npm install grunt-sass \
    && npm install grunt-contrib-uglify-es

ADD run.sh /run.sh
ADD build.sh /build.sh
RUN chmod 755 /run.sh /build.sh
RUN /build.sh
WORKDIR /project/

CMD ["/run.sh"]