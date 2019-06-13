FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

RUN apt-get update && apt-get -y install
RUN apt-get install -y python-pip
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get install -y nodejs

ADD run.sh /run.sh
RUN chmod 755 /run.sh
WORKDIR /project/
RUN npm install -g

CMD ["/run.sh"]