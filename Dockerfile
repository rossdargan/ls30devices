FROM perl:latest

MAINTAINER Ross Dargan dockermaintainer@the-dargans.co.uk

COPY ./LS30 /var/LS30/

WORKDIR /var/LS30/

ENV PERLLIB $PERLLIB:/var/LS30/lib

VOLUME /etc/devices.yaml

ENV LS30_DEVICES=/var/LS30/devices/devices.yaml

RUN cpanm Date::Format YAML AnyEvent

#RUN groupadd -r alarmuser && useradd -r -g alarmuser alarmuser

#USER  alarmuser

CMD ["/var/LS30/bin/list-devices.pl", "-y"]

