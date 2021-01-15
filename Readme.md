# Docker tools
## change-id.sh [user-name] [new-uid] [group-name] [new-gid]

Use that script if you want change uid and gid of provided user.

## emit-ready.sh

Use that script inside docker entrypoint: ./emit-ready.sh
This script will start listening on 10000 tcp port. This way you can find out that the console has been properly started and is ready for use.

## wait-for-it.sh

Use this if you want to wait for other services to start this container. For example, a database migrator has to wait until the database starts up and is able to accept connections. The script waits for the container to listen on the specified tcp port. After that, the command specified in the last parameter will be used.

Użyj tego w pliku docker-compose używając wpisu command: w sekcji services.

./wait-for-it.sh [HOSTS TO WAIT] <command>

### example:
```
services:
    migrator:
        command: /wait-for-it.sh redis:6379 postgres:5432 composer:10000 elasticsearch:9200 kafka-broker:9092 kafka-rest-proxy:8082 kafka-connect:8083 /entrypoint.sh
```

## Dockerfile
In Dockerfile use:
```
RUN git clone https://github.com/Codiway-com/docker-tools.git &&\
    docker-tools/install.sh
```