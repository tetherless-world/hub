#!/bin/bash
#
# This is a one-time script to setup the datasets from LOGD into the Instance Hub Prizms node.
# Run from /home/lebot/prizms/hub/data/source/hub
#
#3> <> rdfs:seeAlso <https://github.com/tetherless-world/hub/wiki/Porting-from-LOGD>;
#3> .

see='https://github.com/timrdf/csv2rdf4lod-automation/wiki/CSV2RDF4LOD-not-set'
CSV2RDF4LOD_HOME=${CSV2RDF4LOD_HOME:?"not set; source csv2rdf4lod/source-me.sh or see $see"}

# cr:data-root cr:source cr:directory-of-datasets cr:dataset cr:directory-of-versions cr:conversion-cockpit
ACCEPTABLE_PWDs="cr:source"
if [ `${CSV2RDF4LOD_HOME}/bin/util/is-pwd-a.sh $ACCEPTABLE_PWDs` != "yes" ]; then
   ${CSV2RDF4LOD_HOME}/bin/util/pwd-not-a.sh $ACCEPTABLE_PWDs
   exit 1
fi

function setup {
   datasetID="$1"
        gdoc="https://docs.google.com/spreadsheet/ccc?key=$2#gid=0"
     eparams="$3"

   mkdir -p $datasetID/version &> /dev/null
   pushd $datasetID/version    &> /dev/null
      rm $datasetID.csv.e1.params.ttl
      pcurl.sh $eparams -n $datasetID -e csv.e1.params.ttl
      cr-dcat-retrieval-url.sh "$gdoc"
      perl -pi -e 's|http://logd.tw.rpi.edu/source/twc-rpi-edu|http://purl.org/twc/hub/source/hub|' $datasetID.csv.e1.params.ttl
      perl -pi -e 's|http://logd.tw.rpi.edu|http://purl.org/twc/hub|'                               $datasetID.csv.e1.params.ttl
      perl -pi -e 's|twc-rpi-edu|hub|'                                                              $datasetID.csv.e1.params.ttl
      perl -pi -e 's|"instance-hub-||'                                                              $datasetID.csv.e1.params.ttl
   popd                        &> /dev/null
}

svn='https://scm.escience.rpi.edu/svn/public/logd-csv2rdf4lod/data/source/twc-rpi-edu'

setup 'countries'                 '0ArTeDpS4-nUDdGx1bm56R0xibkxmRmtiVUhhNG5yWXc' "$svn/instance-hub-countries/version/instance-hub-countries.csv.e1.params.ttl"
setup 'us-states-and-territories' 't9QH44S-_D6-4FQPOCM81BA'                      "$svn/instance-hub-us-states-and-territories/version/instance-hub-us-states-and-territories.csv.e1.params.ttl"
setup 'us-counties'               '0AnUrf7VMa9MadFpvSy1WVW5FNTJXcjc1emNDeXVyRVE' "$svn/instance-hub-us-counties/version/instance-hub-us-counties.csv.e1.params.ttl"
setup 'us-federal-agencies'       'tejNArOGrsY_mV1VeZhYCYg'                      "$svn/instance-hub-us-federal-agencies/version/instance-hub-us-federal-agencies.csv.e1.params.ttl"
setup 'fiscal-years'              '0Al9lLCZTXJQ2dGxLd1dTNkdGNUxQWlY2OW1fazAyWkE' "$svn/instance-hub-fiscal-years/version/instance-hub-fiscal-years.csv.e1.params.ttl"
setup 'us-crops'                  '0ApV67TM6Ml_wdGcxZXJKRzN4NkFheHIyZVhUSTE2dWc' "$svn/instance-hub-us-crops/version/instance-hub-us-crops.csv.e1.params.ttl"
setup 'toxic-chemicals'           '0ApV67TM6Ml_wdE15SnlmLW9aSkRYemp0aElyd1pGb0E' "$svn/instance-hub-us-toxic-chemicals/version/instance-hub-us-toxic-chemicals.csv.e1.params.ttl"
