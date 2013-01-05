#!/bin/bash
DATEFMT=`date "+%Y%m%d%H%M%S"`
declare -f write_file

# @params
#   ${1}: index of thread(s)
#   ${2}: number of folder(s)
#   ${3}: number of file(s) per folder
#   ${4}: block size of test file, xxxK or xxxM
#   ${5}: number of bolck(s)
function write_file {
  for (( i = 0; i < ${2}; i++ )); do
    mkdir "${1}_${i}"
    cd "${1}_${i}"

    for (( j = 0; j < ${3}; j++ )); do
      dd if=/dev/zero of=${j}.img bs=${4} count=${5}
    done
    cd ..
  done
}

# @params
#   ${1}: number of thread
#   ${2}: number of folder(s)
#   ${3}: number of file(s) per folder
#   ${4}: block size of test file, xxxK or xxxM
#   ${5}: number of bolck(s)
((i = 1))
while [ ${i} -le ${1} ]
do
  write_file "${DATEFMT}_${i}" ${2} ${3} ${4} ${5} &
  ((i = ${i} + 1))
done
wait
