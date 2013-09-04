#3> <#> a <http://purl.org/twc/vocab/conversion/CSV2RDF4LOD_environment_variables> ;
#3>     rdfs:seeAlso 
#3>     <http://purl.org/twc/page/csv2rdf4lod/distributed_env_vars>,
#3>     <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Script:-source-me.sh> .

export CSV2RDF4LOD_CONVERT_PERSON_URI="http://tw.rpi.edu/instances/AlexeiBulazel"
source /home/bulaza/prizms/hub/data/source/csv2rdf4lod-source-me-for-hub.sh
alias hub='sudo su hub'
export PATH=$PATH`/home/bulaza/opt/prizms/bin/install/paths.sh`
export CLASSPATH=$CLASSPATH`/home/bulaza/opt/prizms/bin/install/classpaths.sh`
export CSV2RDF4LOD_HOME="/home/bulaza/opt/prizms/repos/csv2rdf4lod-automation"
export DATAFAQS_HOME="/home/bulaza/opt/prizms/repos/DataFAQs"
export JENAROOT=/home/bulaza/opt/apache-jena-2.10.0
