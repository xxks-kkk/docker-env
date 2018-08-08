#!/bin/bash -e

# Usgae: source setup.sh

echo "install emacs"
sudo yum -y install emacs

echo "setup emacs configuration"
rm -rf ~/.emacs.d
git clone git@github.com:xxks-kkk/emacs-config.git ~/.emacs.d

echo "install java"
sudo yum -y install java

echo "install python"
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y update
sudo yum -y install python36u python36u-libs python36u-devel python36u-pip
sudo pip3.6 install jinja2

echo "install cron"
sudo yum -y install cronie

echo "setup bashrc_helpers"
echo "source /work/bashrc_helpers/helpers.sh" >> ~/.bashrc
source ~/.bashrc

echo "setup environment variables"
export BLADE_DIR=/work/blade-install
export LD_LIBRARY_PATH=/work/blade-install/lib:/opt/gcc-4.9.2/lib64
cd /work/blade/
git config user.email "ferrishu3886@gmail.com"
git config user.name "xxks-kkk"

clear
cd /work

