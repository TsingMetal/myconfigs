# install sudo
su
apt-get install sudo
# config the /etc/sudoers


# install vim and git
apt-get install vim-gnome git


# install docker
# install guide link: https://docs.docker.com/install/linux/docker-ce/debian/#install-using-the-repository
sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

# add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER


# install firmwares
# iwlwifi: https://packages.debian.org/sid/firmware-iwlwifi
# rtl_nic/rtl8168h-2.fw: https://packages.debian.org/sid/firmware-realtek
# i915/kbl_dmc_ver1_01.bin: https://packages.debian.org/sid/firmware-misc-nonfree


# install htop
sudo apt-get install htop


# intall java
# jdk download link: http://www.oracle.com/technetwork/java/javase/downloads/index.html
sudo vim /etc/profile
JAVA_HOME=/usr/lib/jdk/jdk-10.0.1
CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME CLASSPATH PATH


# add Chinese support
sudo apt-get install scim scim-pinyin
sudo apt-get install xfonts-wqy
sudo reboot


# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py


# INSTALL python from source
# 1, install make g++
sudo apt-get install make g++
# 2, install indepencies for tkinter and sqlite3
sudo apt-get install tk-dev tcl-dev sqlite3-dev
sudo apt-get install libffi-dev libssl-dev
# 3, for cmd completation
sudo apt-get install libreadline-dev


wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
