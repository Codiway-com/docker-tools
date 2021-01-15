#!/bin/sh
set -x
if [ ! -z "$1" ] && [ ! -z "$3" ]; then
  usermod -u $2 $1
  groupmod -g $4 $3
fi