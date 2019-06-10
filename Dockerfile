FROM library/node
MAINTAINER Konrad Sądel <k.sadel@getprintbox.com>

# Install Bower & Grunt
RUN npm install -g bower grunt-cli && \
    echo '{ "allow_root": true }' > /root/.bowerrc

# Define working directory.
WORKDIR /project

# Define default command.
CMD ["bash"]