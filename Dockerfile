FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

RUN npm install -g bower grunt-cli && \
    echo '{ "allow_root": true }' > /root/.bowerrc

WORKDIR /project

CMD ["/run.sh"]