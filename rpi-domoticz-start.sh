#!/bin/bash
docker run -d \
  -p 8080:8080 \
  --name=rpi-domoticz \
  -v /root/rpi-domoticz/config:/config \
  -v /etc/localtime:/etc/localtime:ro \
  -v /root/rpi-domoticz/scripts/lua:/domoticz/scripts/lua \
  -v /root/rpi-domoticz/scripts/actions:/domoticz/scripts/actions \
  --privileged \
  rpi-domoticz-v1
