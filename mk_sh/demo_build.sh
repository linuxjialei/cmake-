#!/bin/bash
pwd_dir=`pwd`
src_dir=${pwd_dir}/../ 
buid_dir=${buid}
run_bin=${run_bin}

cd "$src_dir"
if [ ! -d build ];then
	mkdir build
fi
cd build
cmake ..
make clean
make

if [ $? -eq 0 ]; then
    echo "Compilation successful！"
	if [ ! -d bin ];then
		mkdir bin
	fi
	if [ ! -d lib ];then
		mkdir lib
	fi
	if [ ! -d cfg ];then
		mkdir cfg
	fi
	if [ ! -d log ];then
		mkdir log
	fi
else
    echo "Compilation failed, please check the code！"
fi



