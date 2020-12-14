#!/bin/bash
declare USER="vagrant"
declare SERVER="192.168.33.10"
declare USER_AT_SERVER="$USER@$SERVER"
declare JAR_NAME="spring-boot-todolist-0.0.1-SNAPSHOT.jar"
declare JAR_PATH="../build/libs/$JAR_NAME"
declare APP_DIR_ON_SERVER="/home/vagrant/todolist/"
declare SVC_NAME="todolist.service"

ssh "$USER_AT_SERVER" mkdir -p $APP_DIR_ON_SERVER
scp $JAR_PATH "$USER_AT_SERVER":$APP_DIR_ON_SERVER
scp todolist.service "$USER_AT_SERVER":$APP_DIR_ON_SERVER
scp overrides.properties "$USER_AT_SERVER":$APP_DIR_ON_SERVER

ssh "$USER_AT_SERVER" /bin/bash << EOF
    sudo mv "$APP_DIR_ON_SERVER"/$SVC_NAME /etc/systemd/system/
    chmod a+x "$APP_DIR_ON_SERVER"/$JAR_NAME
    sudo systemctl restart $SVC_NAME
    sudo systemctl enable $SVC_NAME
    sudo systemctl daemon-reload
EOF
