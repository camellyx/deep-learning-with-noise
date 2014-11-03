#!/usr/bin/env bash

FOLDER=result-$(date +"%y%m%d%H%M")

if [ -d $FOLDER ]; then
  NUM=0
  until [ ! -d $FOLDER-$NUM ]; do
    let "NUM = NUM + 1"
    echo $NUM
  done
  FOLDER=$FOLDER-$NUM
fi

mkdir $FOLDER

for ml in *.py; do
  echo running $ml
  python ./$ml > $FOLDER/${ml%.py}.out 2>&1
done