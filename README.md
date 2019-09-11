# kg7je
Stephen Butler's Debian Package Files for GnuCash


# [GNC] Creating debian package
TechList/gnucash-user

Stephen M. Butler kg7je@arrl.net via gnucash.org 
May 21, 2019, 4:55 PM
to GnuCash

Some have asked how I create the debian packages on Ubuntu.  Someone
more knowledgeable about wiki's may want to capture this in an
appropriate area.

I presume that the user already has an area within $HOME for their
projects.  Mine is ./Projects and holds several different items like
GnC.  Within Projects I have ./GnuCash so it is kept separate from
Subsurface, X-Plane, PicMicro, etc.

You would also need to setup for using dpkg-buildpackage (there are
several web sites that describe the setup for using this).

The below is the commands that would be used if someone wants to start
from nothing (copying from notes so please excuse any typos).

## setup the Projects area just in case my presumption is wrong
 cd $HOME
 mkdir Projects
 cd Projects
 mkdir GnuCash
 cd GnuCash

## grab a clone of the GnuCash git repsoitory
 git clone https://github.com/Gnucash/gnucash
 cd gnucash
 git checkout 3.5   # or 3.4 or whichever you desire.  If you want absolute latest then use "git checkout  maint" instead.
 GITVER=$(git describe)
 MYVER=${GITVER%-*}
 MYRPR=gnucash_${MYVER}
 MYTAR=${MYRPR}.orig.tar

## Pick the Ubuntu version for which you want to compile: trusty, xenial, bionic, disco, etc.
 MYDISTRO=trusty

## bring in the debian folder and modify version and distro flags as noted.
 cp -r ../debian .
 sed -e "s/MYVER/${MYVER}/;s/MYDISTRO/$MYDISTRO/" ../debian/changelog > debian/changelog

## pull in the dependencies as noted in the control file
 sudo mk-build-deps -ir debian/control
## For 3.5 you need to manually change line 137 in $HOME/GnuCash/gnucash/common/cmake_modules/GncAddTest.cmake
 from:       set(GTEST_LIB "${GTEST_SHARED_LIB};${GTEST_MAIN_LIB}" PARENT_SCOPE)
 
 to:       set(GTEST_LIB "${GTEST_MAIN_LIB};${GTEST_SHARED_LIB}" PARENT_SCOPE)

## At this point all is ready to build the debian packages

 dpkg-buildpackage -rfakeroot -b -uc

## Identify debian packages

this will result in 7 files in the GnuCash folder (the parent to the git clone where the above command was run).
of these, the 3 *.deb files are the debian packages to be installed:

 -rw-r--r-- 1 steve steve    19751 May 21 08:17 gnucash_3.5-0_amd64.buildinfo
 -rw-r--r-- 1 steve steve     2266 May 21 08:17 gnucash_3.5-0_amd64.changes
 -rw-r--r-- 1 steve steve  3957024 May 21 08:17 gnucash_3.5-0_amd64.deb
 -rw-r--r-- 1 steve steve  5127172 May 21 08:17 gnucash-common_3.5-0_all.deb
 -rw-r--r-- 1 steve steve 20918176 May 21 08:17 gnucash-dbgsym_3.5-0_amd64.ddeb
 -rw-r--r-- 1 steve steve   269932 May 21 08:17 python3-gnucash_3.5-0_amd64.deb
 -rw-r--r-- 1 steve steve   769424 May 21 08:17 python3-gnucash-dbgsym_3.5-0_amd64.ddeb

## Google Drive

I have added a "debian" folder to the "GnuCash" google drive folder that contains a modified version  of the debian files.  Here is a link to the "GnuCash" folder:

https://drive.google.com/open?id=1s-E6t-snmQiEFaT_hlWF2KHWrIB_LV2x

 -- 
Stephen M Butler, PMP, PSM
Stephen.M.Butler51@gmail.com
kg7je@arrl.net
253-350-0166
-------------------------------------------
GnuPG Fingerprint:  8A25 9726 D439 758D D846 E5D4 282A 5477 0385 81D8
