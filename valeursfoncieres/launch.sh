#!/bin/bash

cd filebeat*
time for i in `seq 1 10`;
do
  echo Launch $i
  rm -Rf data/registry ; ./filebeat --once
done
cd -
