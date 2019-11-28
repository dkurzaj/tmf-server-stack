# PHP 5 is mandatory to run aseco
FROM php:5.3-apache

ARG MYSQL_SERVER='172.20.0.1'
ARG MYSQL_LOGIN='tmf'
ARG MYSQL_PASSWORD='tmfpass'
ARG ASECO_MASTER_ADMIN='YOUR_TMF_LOGIN'
ARG ASECO_ADMIN='YOUR_TMF_LOGIN'
ARG SERVER_SA_PASSWORD='SuperAdmin'

ENV MYSQL_SERVER $MYSQL_SERVER
ENV MYSQL_LOGIN $MYSQL_LOGIN
ENV MYSQL_PASSWORD $MYSQL_PASSWORD
ENV ASECO_MASTER_ADMIN $ASECO_MASTER_ADMIN
ENV ASECO_ADMIN $ASECO_ADMIN
ENV SERVER_SA_PASSWORD $SERVER_SA_PASSWORD

RUN mkdir -p /home/tmf/xaseco

WORKDIR /home/tmf/xaseco

# Allows this image to be able to wait for a DB to be ready
COPY wait-for-it.sh .

# Follow install instructions from http://www.gamers.org/tmf/quickstart.html#xaseco
COPY xaseco_116.zip .
RUN apt-get update && apt-get install -y --force-yes unzip php5-mysql
RUN unzip xaseco_116.zip -d ..

RUN mv newinstall/*.xml .
RUN mv newinstall/*.php ./includes/

COPY settings.sh .
RUN ./settings.sh

# Clean image
RUN rm xaseco_116.zip
RUN rm settings.sh
RUN apt-get autoremove -y unzip

CMD ["./wait-for-it.sh", "127.0.0.1:3306", "--", "php", "aseco.php", "TMF"]
