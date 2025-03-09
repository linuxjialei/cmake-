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
	#拷贝相关库、代码调试工具、配置文件
	cp ../tool/process_cfg.txt ./cfg/

	#打包
	tar zcf demo_update_soft.tar.gz ./bin ./lib ./cfg ./log 
	mv demo_update_soft.tar.gz demo_app.img
	md5sum demo_app.img>demo_app.img.md5
	tar zcf demo_app.tar.gz  demo_app.img*
	mv demo_app.tar.gz demo_app.img
	mv demo_app.img ../mk_sh/
	echo "Packaging successful, demo_ app.img location(current directory):/mk_sh/"
	#解包tar -xzvf  demo_app.img 获取demo_app.img.md5 demo_app.img 计算MD5值与demo_app.img.md5文件内值相等后继续解压tar -xzvf  demo_app.img
else
    echo "Compilation failed, please check the code！"
fi



