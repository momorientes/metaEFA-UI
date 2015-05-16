FROM aexea/aexea-base
MAINTAINER Aexea Carpentry

USER root
RUN apt-get update && apt-get install -y nodejs nodejs-legacy npm ruby ruby-dev build-essential curl
RUN gem install sass
RUN gem install sass-css-importer --pre
RUN npm install -g bower gulp generator-polymer
RUN mkdir -p /opt/code
RUN chown uid1000:uid1000 /opt/code
WORKDIR /opt/code
USER uid1000
ADD package.json ./
RUN npm install .
ADD bower.json ./
RUN bower install
ADD core-dropdown.html bower_components/core-dropdown/
ADD gulpfile.js ./
ADD app ./app
