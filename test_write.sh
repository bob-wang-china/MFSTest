#!/bin/bash

TEST_DIRECTORY="test"
LOG_DIRECTORY="logs"
OUTPUT_PATH=`date "+%Y%m%d%H%M%S"`

PROCESSES_COUNT=1
FILES_COUNT=1
BLOCK_SIZE=1K
BLOCKES_COUNT=1

while getopts "p:f:s:b:d" arg #选项后面的冒号表示该选项需要参数
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

source './func'

if [ ! -d $LOG_DIRECTORY ]; then
  echo "no logs directory, creating ..."
  mkdir $LOG_DIRECTORY
fi

concurrent_write_files "$TEST_DIRECTORY/$OUTPUT_PATH" $FILES_COUNT $BLOCK_SIZE $BLOCKES_COUNT $PROCESSES_COUNT

#echo "# goal: 1"

#echo "## 大文件100M，单client单进程"
#echo "### 写入..."
#test_write 1 1000 1M 100 >"$LOG_DIRECTORY/1g_100M_1c_1p_write.log" 2>&1
#echo "### 读取..."
#test_read >"$LOG_DIRECTORY/1g_100M_1c_1p_read.log" 2>&1
#echo "### 删除..."
#test_delete >"$LOG_DIRECTORY/1g_100M_1c_1p_delete.log" 2>&1

#echo "## 大文件100M，单client双进程"
#echo "### 写入..."
#test_write 2 500 1M 100 >"$LOG_DIRECTORY/1g_100M_1c_2p_write.log" 2>&1
#echo "### 读取..."
#test_read >"$LOG_DIRECTORY/1g_100M_1c_2p_read.log" 2>&1
#echo "### 删除..."
#test_delete >"$LOG_DIRECTORY/1g_100M_1c_2p_delete.log" 2>&1

#echo "## 大文件100M，单client四进程"
#echo "### 写入..."
#test_write 4 250 1M 100 >"$LOG_DIRECTORY/1g_100M_1c_4p_write.log" 2>&1
#echo "### 读取..."
#test_read >"$LOG_DIRECTORY/1g_100M_1c_4p_read.log" 2>&1
#echo "### 删除..."
#test_delete >"$LOG_DIRECTORY/1g_100M_1c_4p_delete.log" 2>&1

#echo "## 大文件50M，单client单进程"
#echo "### 写入..."
#test_write 1 2000 1M 50 >"$LOG_DIRECTORY/1g_50M_1c_1p_write.log" 2>&1
#echo "### 读取..."
#test_read >"$LOG_DIRECTORY/1g_50M_1c_1p_read.log" 2>&1
#echo "### 删除..."
#test_delete >"$LOG_DIRECTORY/1g_50M_1c_1p_delete.log" 2>&1

#echo "## 大文件50M，单client双进程"
#echo "### 写入..."
#test_write 1 1000 1M 50 >"$LOG_DIRECTORY/1g_50M_1c_2p_write.log" 2>&1
#echo "### 读取..."
#test_read >"$LOG_DIRECTORY/1g_50M_1c_2p_read.log" 2>&1
#echo "### 删除..."
#test_delete >"$LOG_DIRECTORY/1g_50M_1c_2p_delete.log" 2>&1

