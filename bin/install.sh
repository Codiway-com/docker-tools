#!/bin/sh
DIR=`dirname $(readlink -f $0)`
echo $DIR
cp $DIR/emit-ready.sh /bin/emit-ready.sh
cp $DIR/wait-for-it.sh /bin/wait-for-it.sh
cp $DIR/change-id.sh /bin/change-id.sh