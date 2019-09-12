#!/bin/bash
clear
# this script was developed to install a basic development environment
# for GnuCash > V3 on a Linux Mint 19 OS
echo "Script to install development environment for GnuCash ~V3.0"
echo ""
echo "Installing build environment:"
echo "   build-essential"
sudo apt install build-essential
echo "   cmake"
sudo apt install cmake
echo "   ninja-build"
sudo apt install ninja-build
echo ""
echo "Installing GnuCash dependencies and development headers:"
echo "   libglib2.0 and dev headers"
sudo apt install libglib2.0 libglib2.0-dev
echo "   libxml2 libxml++2.6-dev libxml2-utils"
sudo apt install libxml2 libxml++2.6-dev libxml2-utils
echo "   libxslt1.1 libxslt1-dev"
sudo apt install libxslt1.1 libxslt1-dev
echo "   libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev"
sudo apt install libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev
echo "   gtk+3.0 libgtk-3-dev"
sudo apt install gtk+3.0 libgtk-3-dev
echo "   zlib1g zlib1g-dev"
sudo apt install zlib1g zlib1g-dev
echo "   guile-2.0 guile-2.0-dev"
sudo apt install guile-2.0 guile-2.0-dev
echo "   swig   3.0 on LM19  2.0 on Lm18?"
sudo apt install swig
echo "   sudo apt-get install libboost-all-dev"
sudo apt-get install libboost-all-dev
echo "   libsecret-1-0 libsecret-1-0-dev"
sudo apt-get install libsecret-1-0 libsecret-1-0-dev
echo " AqBanking Tools"
echo "   aqbanking-tools libaqbanking-dev"
sudo apt-get install aqbanking-tools libaqbanking-dev 
echo "   gwenhywfar-tools libgwenhywfar60 libgwenhywfar60-dev"
sudo apt-get install gwenhywfar-tools libgwenhywfar60 libgwenhywfar60-dev
echo "   ktoblzcheck libktoblzcheck1-dev"
sudo apt-get install ktoblzcheck libktoblzcheck1-dev
echo " OFX support"
echo "   libofx libofx-dev"
sudo apt-get install libofx-dev
echo "   xsltproc"
sudo apt-get install xsltproc
echo " Database backend support"
echo "   libdbi1 libdbi-dev libdbd-pgsql libdbd-mysql libdbd-sqlite3"
sudo apt-get install libdbi1 libdbi-dev libdbd-pgsql libdbd-mysql libdbd-sqlite3
echo " Python support"
sudo apt-get install python3-pytest
echo " Google Test"
sudo apt install googletest


