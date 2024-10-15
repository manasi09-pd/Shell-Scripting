#!/bin/bash
echo "Script to Install a Package"
echo "Installation started"
read -p "First enter the package you want to install: " package
#Function to install a package on Debian system (like ubuntu)
install_debian() 
{
	sudo apt-get update
	sudo apt-get install -y $package
}
#Function to install  an package with redhat system 
install_redhat (){
	sudo yum update
	yum install -y $package
}
#Function to install on macos
install_macos (){
	bew install $package 
}
#detect the operating system
OS_TYPE=$(uname)

#check the OS type and call the appropriate function.
case "$OS_TYPE" in
	Linux)
		#check if the system is debian or redhat
		if [ -f /etc/debian_version ]; then
			echo "Detected debian-based system"
			install_debian "$package"
                elif [ -f /etc/redhat-release ]; then
			echo "Detected Red-Hat system"
		       install_redhat "$package"
	        else
	               echo "unknown Linux distribution"
	               exit 1
	        fi	       
                ;;
	Darwin)
		echo "Detected the Macos"
		install_macos "$package"
		;;

	*)
		echo "Unsupported operating system: $OS_TYPE"
		exit 1
		;;

esac
echo "Installation completed"

