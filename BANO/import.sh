#!/bin/bash

import_region () {
    export REGION=$1
    FILE=bano-data/bano-$REGION.csv
    echo $FILE
    #curl -XDELETE https://search-david-es-nuoztysi4riwf47lagde3ago5a.eu-west-1.es.amazonaws.com/.bano-$REGION?pretty
    #curl -XDELETE localhost:9200/.bano-$REGION?pretty
    cat $FILE | logstash -f bano-data.conf
}
DEPTS=95
for i in {01..19} $(seq 21 $DEPTS) {971..974} {976..976} ; do
    DEPT=$(printf %02d $i)
    import_region $DEPT
done
