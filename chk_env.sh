#!/bin/bash
check_command(){

CMD=$1
FindCMD="which"
chk_cmd=`$FindCMD $CMD | sed -e 's/^.[a-zA-Z].*: //'`
	if [[ $chk_cmd = "" ]];then
		result="empty"
	else
		result="exist"
	fi
}		

## Check the command - sudo
	result=""
	check_command sudo
	if [[ $result = "empty"  ]];then
		SUDO=""
	else
		SUDO="sudo"
	fi

## Check the command - yum
	result=""
	check_command yum
	if [[ $result = "empty"  ]];then
		install_mgr="apt-get"
	else
		install_mgr="yum"
	fi

## Check the command - zinst
	result=""
	check_command zinst
	if [[ $result = "empty"  ]];then
		curl -sL bit.ly/online-install |bash
	fi

## Check the command jq
	result=""
	check_command jq
	if [[ $result = "empty"  ]];then
		$SUDO $install_mgr install jq -y
	fi
