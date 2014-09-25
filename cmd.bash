#$ -cwd
#$ -S /bin/bash
$( echo "#$ -N testing" ) 
$( echo "#$ -t 1-$#" )
#$ -e logs
#$ -o logs

# experimental: may allow you to pass in a list of PDBs 
# to run concurrently in a SGE task array

my=( "$@" ) 

export PATH=/home/carlin/Rosetta/main/source/bin:$PATH
export ROSETTA3_DB=/home/carlin/Rosetta/main/database

rosetta_scripts.linuxgccrelease --parser:protocol design-off.xml \
  @enzdes.flags -s ${my[${SGE_TASK_ID}]}

