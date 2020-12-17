#!/bin/bash
: ${SLEEP_LENGTH:=2}

wait_for() {
  echo Waiting for $1 to listen on $2...
  while ! nc -z $1 $2; do echo Waiting for $1 to listen on $2...; sleep $SLEEP_LENGTH; done
}

length=$(($#-1))
for var in "${@:1:$length}"
do
  host=${var%:*}
  port=${var#*:}
  wait_for $host $port
done

eval ${!#}