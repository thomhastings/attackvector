#!/bin/sh
# reference url http://www.phillips321.co.uk/2012/08/28/making-backtrack5-look-like-xp/
# relevant documentation http://www.kalilinux.net/community/threads/theme-on-kali.110/
cd /tmp
wget -N http://www.phillips321.co.uk/downloads/LookLikeXP.deb
dpkg -i LookLikeXP.deb
#wget -N http://ubuntusatanic.org/hell/pool/main/s/satanic-icon-themes/satanic-icon-themes_666.7_all.deb
#dpkg -i satanic-icon-themes_666.7_all.deb
wget -N http://www.sprezzatech.com/apt/pool/main/o/omphalos/omphalos_0.99.7~rc1-SprezzOS2_amd64.deb
dpkg -i omphalos_0.99.7~rc1-SprezzOS2_amd64.deb
rm *.deb
