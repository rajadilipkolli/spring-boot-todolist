# spring-boot-todolist

A sample SpringBoot application to learn various deployment options.

![Master Branch CI](https://github.com/sivaprasadreddy/spring-boot-todolist/workflows/Master%20Branch%20CI/badge.svg)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=sivaprasadreddy_spring-boot-todolist&metric=alert_status)](https://sonarcloud.io/dashboard?id=sivaprasadreddy_spring-boot-todolist)


## Deploying on VM using Vagrant

Install Vagrant https://www.vagrantup.com/docs/installation

```shell script
cd spring-boot-todolist
./gradlew clean build
cd deployment
vagrant up
./deploy.sh
```
