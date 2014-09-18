FROM ubuntu:14.04
MAINTAINER Keyvan Fatehi <keyvanfatehi@gmail.com>
RUN apt-get -y update
RUN apt-get -y install nodejs npm make build-essential python python-dev
RUN npm install js-yaml sinopia@0.11.1 
RUN adduser --disabled-password --gecos "" sinopia
RUN mkdir -p /opt/sinopia/storage
RUN chown -R sinopia:sinopia /opt/sinopia
USER sinopia
WORKDIR /opt/sinopia
ADD /config_gen.js /home/sinopia/config_gen.js
ADD /start.sh /home/sinopia/start.sh
CMD ["/home/sinopia/start.sh"]
EXPOSE 4873
VOLUME /opt/sinopia
