#!/bin/sh
set -x
cd /opt/render/project/src
flask --app=sensorhub init-db 2>&1
flask --app=sensorhub testgen 2>&1
exec gunicorn -w 3 -b 0.0.0.0:10000 "sensorhub:create_app()"