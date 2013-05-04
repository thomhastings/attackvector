#!/bin/sh
cd /tmp
MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} = 'x86_64' ]
then
    URL="http://www.srware.net/downloads/iron64.deb"
else
    URL="http://www.srware.net/downloads/iron.deb"
fi
FILE="iron-browser.deb"
wget -N "$URL" -O $FILE && sudo dpkg -i $FILE
rm $FILE
# TODO: Automate run-as-root fix ->
# http://em3rgency.com/install-google-chrome-on-kali/
# TODO: Automate import of pentest-bookmarks ->
# http://code.google.com/p/pentest-bookmarks/
# TODO: Automate set default search engine ->
# http://startpage.com http://duckduckgo.com
# TODO: Automate adding http://crypto.cat
