#!/bin/sh
# relevant documentation https://tails.boum.org/todo/windows_theme/ # MATE is gonna work better
# relevant documentation http://docs.kali.org/live-build/customize-the-kali-desktop-environment
WORKINGDIR=`pwd`

cd /tmp
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} = 'x86_64' ]
then
    URL="https://launchpad.net/~phylu/+archive/usplash-theme-fingerprint/+files/usplash-theme-fingerprint_0.16~ubuntu1_amd64.deb"
else
    URL="https://launchpad.net/~phylu/+archive/usplash-theme-fingerprint/+files/usplash-theme-fingerprint_0.16~ubuntu1_i386.deb"
fi
FILE="u-fingerprint.deb"
wget -N "$URL" -O $FILE && sudo dpkg -i $FILE -y
#rm $FILE

cd /usr/share/backgrounds/gnome/
wget -N http://www.n1tr0g3n.com/wp-content/uploads/2011/12/Green_dragon_by_archstroke.png -O AttackVector.png
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/gnome/AttackVector.png

# reference url http://docs.kali.org/live-build/customize-the-kali-desktop-environment#7ax4m1eg4469_5
echo "deb http://repo.mate-desktop.org/debian wheezy main" >> /etc/apt/sources.list
apt-get update
apt-get install mate-archive-keyring -y
apt-get install git live-build cdebootstrap -y
git clone git://git.kali.org/live-build-config.git
cd live-build-config
mkdir config/archives
echo "deb http://repo.mate-desktop.org/debian wheezy main" > config/archives/mate.list.binary
echo "deb http://repo.mate-desktop.org/debian wheezy main" > config/archives/mate.list.chroot
cp /usr/share/keyrings/mate-archive-keyring.gpg  config/archives/mate.key.binary
cp /usr/share/keyrings/mate-archive-keyring.gpg  config/archives/mate.key.chroot
echo "sleep 20" >> config/hooks/z_sleep.chroot
# add mate desktop to the packages list:
echo "xorg" >> $WORKINGDIR/../distro-src/config/package-lists/kali.list.chroot
echo "mate-archive-keyring" >> config/package-lists/kali.list.chroot
echo "mate-core" >> config/package-lists/kali.list.chroot
echo "mate-desktop-environment" >> config/package-lists/kali.list.chroot

cd /usr/share/themes/
apt-get install p7zip -y
wget -N http://fc00.deviantart.net/fs71/f/2009/342/a/0/Gnome_Buuf_Deuce_1_1_R8_by_djany.7z -O buuf_deuce.7z
p7zip -d buuf_deuce.7z # better iconset http://gnome-look.org/content/show.php?content=81153
mv Buuf-Deuce-1.1-R8.tar.bz2 buuf_deuce.tar.bz2
tar xvf buuf_deuce.tar.bz2
rm buuf_deuce.tar.bz2
sudo chmod 755 Buuf-Deuce # for pidgin http://gnome-look.org/content/show.php?content=118412
gsettings set org.gnome.desktop.interface icon-theme Buuf-Deuce
wget -N http://buuficontheme.free.fr/buuf3.8.tar.xz # better release of the iconset
tar xvf buuf3.8.tar.xz

wget -N http://gnome-look.org/CONTENT/content-files/108928-terminus.tar.gz -O terminus.tar.gz
tar xvf terminus.tar.gz
rm terminus.tar.gz
mv terminus Terminus  # elegant-mine, elegant-brit also acceptable
gsettings set org.gnome.desktop.wm.preferences theme Terminus
gsettings set org.gnome.desktop.interface gtk-theme Terminus
wget -N http://gnome-look.org/CONTENT/content-files/127846-AlienWare.tar.gz -O alien.tar.gz
tar xvf alien.tar.gz
rm alien.tar.gz

# TODO http://gnome-look.org/content/show.php?content=50468
# TODO https://launchpad.net/~phylu/+archive/boot-fingerprint
# TODO https://launchpad.net/~phylu/+archive/usplash-theme-fingerprint
# TODO http://u-fingerprint.sourceforge.net/downloads.html w/ git-cvsimport
#git cvsimport -v -d :pserver:anonymous@u-fingerprint.cvs.sourceforge.net:/cvsroot/u-fingerprint u-fingerprint
#rsync -av rsync://u-fingerprint.cvs.sourceforge.net/cvsroot/u-fingerprint u-fingerprint