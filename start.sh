#!/bin/sh
cd /opt/render/project/src
flask --app=sensorhub init-db
flask --app=sensorhub testgen
flask --app=sensorhub masterkey
exec gunicorn -w 3 -b 0.0.0.0:10000 "sensorhub:create_app()"