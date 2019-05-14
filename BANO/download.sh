#!/bin/bash
set -e
download () {
  wget http://bano.openstreetmap.fr/data/$1 --timestamping --directory-prefix=bano-data -c --no-verbose --show-progress
}
DEPTS=95
for i in {01..19} $(seq 21 $DEPTS) {971..974} {976..976} ; do 
  DEPT=$(printf %02d $i)
  echo Downloading bano department $DEPT
  download bano-$DEPT.csv
done