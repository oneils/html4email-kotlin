#!/bin/sh

# Starts the application, log the application PID to the idgst.pid file

nohup ./gradlew bootRun > application.log 2> application.errors.log < /dev/null &
PID=$!
echo $PID > idgst.pid