#!/bin/bash

DATEFMT=`date "+%Y%m%d%H%M%S"`
declare -f write_file

# @params
#   ${1}: index of thread(s)
#   ${2}: number of file(s)
#   ${3}: block size of test file, xxxK or xxxM
#   ${4}: number of bolck(s)
function write_file {
  for (( i = 0; i < ${2}; i++ )); do
    dd if=/dev/zero of=${1}.img bs=${3} count=${4}
  done
}

# @params
#   ${1}: number of thread
#   ${2}: number of file(s)
#   ${3}: block size of test file, xxxK or xxxM
#   ${4}: number of bolck(s)
((i = 1))
while [ ${i} -le ${1} ]
do
  write_file "${DATEFMT}_${i}" ${2} ${3} ${4} &
  ((i = ${i} + 1))
done
wait
