#!/bin/bash
# git-kali.sh
# a.k.a. "how I ripped off kali and stole all their hard work"
for LINE in `curl http://git.kali.org/gitweb/?a=project_index`
do
	set REPO = `echo $LINE | awk -F. '{print $1}'`
    git submodule add git://git.kali.org/$LINE src/kali/$REPO
    git commit -a -m "kali submodule $REPO"
done
