FROM resin/rpi-raspbian

MAINTAINER Sebastien LAPORTE

RUN apt-get update && \
    apt-get install -y  nano \
                        git \
                        openssl \
                        wget \
                        ca-certificates \
                        netcat \
                        libcurl4-openssl-dev \
			php5

# Install domoticz
RUN mkdir /domoticz && \
    cd /domoticz && \
    wget http://www.domoticz.com/releases/release/domoticz_linux_armv7l.tgz && \
    tar xvfz domoticz_linux_armv7l.tgz && \
    rm domoticz_linux_armv7l.tgz

# Config directory, should be persisted
VOLUME ["/config"]

# HTTP port (web interface)
EXPOSE 8080

ENTRYPOINT ["/domoticz/domoticz", "-dbase", "/config/domoticz.db", "-log", "/config/domoticz.log"]

CMD ["-www", "8080"]
