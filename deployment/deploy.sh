#!/bin/bash
declare USER="vagrant"
declare SERVER="192.168.33.10"
declare USER_AT_SERVER="$USER@$SERVER"
declare JAR_NAME="spring-boot-todolist-0.0.1-SNAPSHOT.jar"
declare JAR_PATH="../build/libs/$JAR_NAME"
declare APP_DIR_ON_SERVER="/home/vagrant/todolist/"

ssh "$USER_AT_SERVER" mkdir -p $APP_DIR_ON_SERVER
scp $JAR_PATH "$USER_AT_SERVER":$APP_DIR_ON_SERVER
scp todolist.sh "$USER_AT_SERVER":$APP_DIR_ON_SERVER
scp overrides.properties "$USER_AT_SERVER":$APP_DIR_ON_SERVER/application.properties

ssh "$USER_AT_SERVER" /bin/bash << EOF
    cd $APP_DIR_ON_SERVER
    chmod a+x $JAR_NAME
    chmod a+x todolist.sh
    nohup ./todolist.sh restart > nohup.out 2> nohup.err < /dev/null &
EOF
