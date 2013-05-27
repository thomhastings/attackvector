[AttackVector Linux](http://attackvector.org): the dragon has tails
===================================================================
![screenshot](http://josh.myhugesite.com/static/images/attackvector-wallpaper.jpg)  
**AttackVector Linux** is a new distribution for anonymized security testing.  
It is based on [Kali](http://kali.org) with ideas gleaned from [TAILS](https://tails.boum.org) (both Debian based), with tools not found in either.

-------------------------------------------------------------------

Design Philosophy
=================
**Yin** and _Yang_

While Kali requires a modified kernel for network drivers to use injection and so forth,  
TAILS is designed from the bottom up for encryption, and anonymity. _Nmap can't UDP via Tor._  
**The intention of AttackVector Linux is to provide the capability to anonymize attacks  
_while warning the user when he or she takes actions that may compromise anonymity._**  
The two projects have different design philosophies that can directly conflict with one another.  
In spite of this, the goal of **AttackVector Linux** is to integrate them into one complimentary OS.

##### Features
* APT/Iceweasel/wget all run through TOR (using Polipo)
* Iceweasel includes cookie monster, HTTPSEverywhere, TORButton, and other great extensions
* Incredible password recovery tools:
** The password recovery of [hashkill](http://www.gat3way.eu/hashkill)
** OCLHashcat
** Many more!
* Great Ruby tools like [Ronin](https://github.com/ronin-ruby/)
* The penetration tools of [Kali](http://kali.org)
* Other tools like FakeAP, sdmem

Build Instructions
==================

## Install prerequisites for Kali build. This can be done in Debian Squeeze, but we recommend starting from a Kali install:

* apt-get install git live-build cdebootstrap kali-archive-keyring
* cd /tmp
* git clone git clone https://attackvector@bitbucket.org/attackvector/attackvector-linux.git
* apt-get remove libdebian-installer4
* apt-get install libdebian-installer4
** We reinstall libdebian-installer4 due to a weird bug
* cd attackvector-linux/live-build-config

## Live build:

* lb clean --purge
* dpkg --add-architecture amd64
* apt-get update
* lb config --architecture amd64 --mirror-binary http://http.kali.org/kali --mirror-binary-security http://security.kali.org/kali-security --apt-options "--force-yes --yes"
* lb build

Download
========
* mirror [BitBucket](https://bitbucket.org/attackvector/attackvector-linux/downloads)  
* MD5 (attack_vector_alpha_0.1.1b.iso) = 99243d5f4132116e2e9606d6b0c98e6f

Add-ons list
========
##### Additional Debian Packages:

###### Packages for service wrapper, supports i2p               
* libservice-wrapper-java                                       
* libservice-wrapper-jni                                        
* service-wrapper                                               
                                                              
###### Package for hashkill                                        
* libssl-dev                                                    
* libjson0-dev                                                  
* amd-opencl-dev                                                
* nvidia-opencl-dev

###### Packages we want in general
* adduser
* binutils
* bsdutils
* chkconfig
* coreutils
* curl
* diffutils
* dnsutils
* dsniff
* findutils
* florence
* fuse-utils
* gnupg
* gnupg-agent
* gnupg-curl
* gnutls-bin
* gzip
* haveged
* i2p
* i2p-router
* ipheth-utils
* iproute
* iptstate
* iputils-ping
* iputils-tracepath
* john
* john-data
* keepassx
* laptop-mode-tools
* libsqlite3-dev
* libsqlite3-ruby1.9.1
* liferea
* liferea-data
* lockfile-progs
* lua5.1
* lzma
* moreutils
* mtools
* ncurses-base
* ncurses-bin
* net-tools
* netcat-traditional
* nmap
* openssl
* pidgin
* pidgin-data
* pidgin-otr
* polipo
* poppler-utils
* pwgen
* rfkill
* ruby1.9.1
* ruby1.9.1-dev
* rubygems
* seahorse
* seahorse-nautilus
* secure-delete
* sqlite3
* sshfs
* ssss
* tor
* tor-arm
* tor-geoipdb
* torsocks
* tsocks
* unar
* unzip
* vim-nox
* vim-runtime
* vim-tiny
* wget
* whois
* xul-ext-adblock-plus
* xul-ext-cookie-monster
* xul-ext-foxyproxy-standard
* xul-ext-https-everywhere
* xul-ext-noscript
* xul-ext-torbutton

###### Other Source Packages/Binaries:
* hashkill
* fakeap
* quicksnap

###### Ruby Gems:
* gem install ronin
* gem install ronin-asm
* gem install ronin-dorks
* gem install ronin-exploits
* gem install ronin-gen
* gem install ronin-grid
* gem install ronin-php
* gem install ronin-scanners
* gem install ronin-sql
* gem install ronin-support
* gem install ronin-web

###### Configuration:
* Polipo -> TOR
* wget -> Polipo
* APT -> Polipo
* sdmem (wipes memory at shutdown/reboot)

-------------
###### social
> IRC **#attackvector** on Freenode  
> [![Tweet This](http://ampedstatus.org/wp-content/plugins/tweet-this/icons/en/twitter/tt-twitter-micro4.png)](https://twitter.com/intent/tweet?text=%40attackvector)[![Facebook](http://daviddegraw.org/wp-content/plugins/tweet-this/icons/tt-facebook-micro4.png)](http://facebook.com/AttackVector-Linux)[![Linkedin](http://www.hollybrady.com/bradyholly/wp-content/plugins/tweet-this/icons/en/linkedin/tt-linkedin-micro4.png)](http://linkedin.com/in/AttackVector)  
> ![Web Mockup](https://sourceforge.net/p/attackvector/screenshot/attackvector_header.jpg)  
> (Web Mockup)

##### Docs
* [Live Build Manual](http://live.debian.net/manual/3.x/html/live-manual/index.en.html)
* [TAILS git branches](https://tails.boum.org/contribute/git/#index4h3)
* How to [build TAILS](https://tails.boum.org/contribute/build/#index1h1)
* How to [customize TAILS](https://tails.boum.org/contribute/customize/#index1h1)
* [Rebuilding a Kali Package](http://docs.kali.org/development/rebuilding-a-package-from-source)
* [Rebuilding the Kali Kernel](http://docs.kali.org/development/recompiling-the-kali-linux-kernel)
* [Live Build a Custom Kali ISO](http://docs.kali.org/live-build/live-build-a-custom-kali-iso)
* How to [customize Debian live](http://live.debian.net/manual/current/html/live-manual/customizing-contents.en.html)

Project Status
==============
![UML Diagram](https://sourceforge.net/p/attackvector/screenshot/attackvector-uml-diagram2.png)
It seems our best structural approach is customizing the [Kali Live Build scripts](http://docs.kali.org/live-build/live-build-a-custom-kali-iso).  
Eventually this Kali derivative should meet the [TAILS design specifications](https://tails.boum.org/contribute/design/#index13h2).

##### Git
* [Kali git repositories](http://git.kali.org/gitweb/)
* [TAILS git repository](http://git.immerda.ch/?p=amnesia.git)
* Configure build system to generate & test ISOs

##### Tasks
* Add warning messages for anonymity risks
* Full Disk Encryption (FDE) w/ [LUKS](https://code.google.com/p/cryptsetup/)
* Host on [AttackVector.org](http://attackvector.org)
* Provide documentation
* Debian repositories
* Add more tools!

![Tor Connected](http://josh.myhugesite.com/static/images/attackvector-test.jpg)
--------------
###### license
> [![Creative Commons License](http://i.creativecommons.org/l/by/3.0/80x15.png)](http://creativecommons.org/licenses/by/3.0/)[![Open Source](http://www.ipol.im/static/badges/open-source.png)](http://www.gnu.org/licenses/gpl.html)[![Hacker Emblem](http://catb.org/hacker-emblem/hacker.png)](http://www.catb.org/hacker-emblem/)  
> Text under [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/). Code under [GNU Public License](http://www.gnu.org/licenses/gpl.html).
