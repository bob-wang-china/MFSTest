#!/bin/bash

OUTPUT_PATH="."
TIMESTAMP=`date "+%Y%m%d%H%M%S"`

PROCESSES_COUNT=1
FILES_COUNT=1
BLOCK_SIZE=1K
BLOCKES_COUNT=1

while getopts "p:f:s:b:d:" arg #选项后面的冒号表示该选项需要参数
do
  case $arg in
  p)
    PROCESSES_COUNT=$OPTARG
    ;;
  f)
    FILES_COUNT=$OPTARG
    ;;
  s)
    BLOCK_SIZE=$OPTARG
    ;;
  b)
    BLOCKES_COUNT=$OPTARG
    ;;
  d)
    OUTPUT_PATH=$OPTARG
    ;;
  ?)  #当有不认识的选项的时候arg为?
    echo "unkonw argument"
    exit 1
    ;;
  esac
done

TEST_DIRECTORY="$OUTPUT_PATH/test/$TIMESTAMP"
#echo $TEST_DIRECTORY
#echo $PROCESSES_COUNT
#echo $FILES_COUNT
#echo $BLOCKES_COUNT
#echo $BLOCK_SIZE

source './func'

concurrent_write_files "$TEST_DIRECTORY" $FILES_COUNT $BLOCK_SIZE $BLOCKES_COUNT $PROCESSES_COUNT
