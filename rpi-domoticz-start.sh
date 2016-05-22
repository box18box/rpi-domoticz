#!/bin/bash
docker run -d \
  -p 8080:8080 \
  --name=rpi-domoticz \
  -v /etc/localtime:/etc/localtime:ro \
  -v /root/persistent/rpi-domoticz/config:/config \
  -v /root/persistent/rpi-domoticz/scripts/lua:/domoticz/scripts/lua \
  -v /root/persistent/rpi-domoticz/scripts/actions:/domoticz/scripts/actions \
  --privileged \
  rpi-domoticz-v1
