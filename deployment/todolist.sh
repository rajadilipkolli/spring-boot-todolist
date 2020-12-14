#!/bin/bash

declare JAR_NAME="spring-boot-todolist-0.0.1-SNAPSHOT.jar"
#set -x

function help() {
    echo "=================================="
    echo "USAGE:"
    echo "Start app: ./run.sh start <profiles>"
    echo "Stop app: ./run.sh stop"
    echo "Restart app: ./run.sh restart <profiles>"
    echo "Ex: ./run.sh start prod,aws"
    echo "=================================="
}

function start() {
    profiles="default"
    if [[ "$1" != ""  ]]
    then
        profiles="$1"
    fi
    echo "Starting the application with profiles: $profiles"
    export PATH="$HOME/.sdkman/candidates/java/current/bin:$PATH"
    echo "Java Version: `java --version`"
    nohup java -jar $JAR_NAME --spring.profiles.active=$profiles -Xms1G -Xmx3G > nohup.log &
    echo "Started."
}

function stop() {
    echo "Stopping the application"
    FILE="todolist.pid"
    if [ -f "$FILE" ]; then
        echo "Found PID file $FILE"
        kill `cat $FILE`
    fi
}

function restart() {
    stop
    sleep 2
    start $1
}

function healthcheck() {
    curl http://localhost:8080/actuator/health
}

action="help"

if [[ "$#" != "0"  ]]
then
    action=$@
fi

eval ${action}
