#!/bin/bash

DUMP="/var/tmp/postgresql.dump"

if [ -e $DUMP ]; then
  echo $DUMP already exists.
  exit 1
fi

touch $DUMP && chmod 0600 $DUMP
if [ "$?" -ne "0" ]; then
  exit 1
fi

/usr/bin/pg_dumpall -o > ${DUMP}
