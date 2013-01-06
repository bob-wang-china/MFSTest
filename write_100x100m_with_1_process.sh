#!/bin/bash
echo $1
./test_write.sh -p 1 -f 100 -s 100M -b 1 -d $1
