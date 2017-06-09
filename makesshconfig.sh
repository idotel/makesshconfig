#!/bin/bash

##check to see if the script is running as root

user=`whoami`
if [[ $user == root ]]; then
	clear
	echo "Do not run this script as root!"
	sleep 2
	echo "exiting script"
	sleep 1
	exit
else
	echo " "
fi

##create and configure config file if none exist

cd ~/.ssh/
configfile=`ls ~/.ssh/ | grep -i config`
if [[ $configfile == config ]]; then
	clear
	echo "config file already exist"
	echo "no changes will be made!"
	sleep 4
else
	echo "creating config file"
	sleep 4
	touch config
	#clear > ~/.ssh/config
	echo "UseKeychain yes" > ~/.ssh/config
	echo "AddKeysToAgent yes" >> ~/.ssh/config
	echo "ForwardAgent yes" >> ~/.ssh/config
	echo "ForwardX11 no" >> ~/.ssh/config
	echo "IdentityFile ~/.ssh/id_rsa" >> ~/.ssh/config
fi

echo "These are the contents of your current SSH config file"
echo " "
cat ~/.ssh/config
sleep 2
exit
