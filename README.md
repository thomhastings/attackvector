[AttackVector Linux](http://attackvector.org): the dragon has tails

=================================================================== 
**AttackVector Linux** is a new distribution for anonymized security testing.  
It is based on [custom](http://sf.net/p/customwheezy7) [Kali](http://kali.org) with ideas gleaned from [Tails](https://tails.boum.org) (both [Debian](http://debian.org) based), with tools not found in either.

-------------------------------------------------------------------

Design Philosophy
=================
**Yin** and _Yang_

_AttackVector Linux_ (A.V.L.) is a [Kali](http://kali.org) [live-build](http://docs.kali.org/live-build/live-build-a-custom-kali-iso) "recipe", which can be thought of as add-ons for Kali live-build.  
The biggest add-on is [Tor](http://torproject.org) _installed_ by default. It is taken from [Tails](http://tails.boum.org)' [design](https://tails.boum.org/contribute/design/).  

**Kali** vs. _Tails_

While Kali requires a modified kernel for network drivers to use injection and so forth,  
TAILS is designed from the bottom up for encryption, and anonymity. _Nmap can't UDP via Tor._  
**The intention of AttackVector Linux is to provide the capability to anonymize attacks  
_while warning the user when he or she takes actions that may compromise anonymity._**  
The two projects have different design philosophies that can directly conflict with one another.  
In spite of this, the goal of **AttackVector Linux** is to integrate them into one complimentary OS.

##### Features
* apt/iceweasel/wget all run through tor (using polipo)
* Iceweasel includes cookie monster, HTTPSeverywhere, TORbutton, and other great extensions
* Incredible password recovery tools: [hashkill](http://www.gat3way.eu/hashkill) OCLHashcat, many more!
* Great Ruby tools like [Ronin](https://github.com/ronin-ruby/)
* Every penetration testing security tool from [Kali](http://kali.org). (Yes, [really](https://gist.github.com/ksoona/5691841).)
* Additional tools for pen-testing, password cracking, and more
* Dedicated install with FDE and [wordlists galore](https://github.com/thomhastings/bt5-scripts/blob/master/get-wordlists.sh).
* Other tools like FakeAP, sdmem

Download
========
* mirror [BitBucket](https://bitbucket.org/attackvector/attackvector-linux/downloads)  
* mirror [Act4Security.com](http://act4security.com/attack_vector_alpha_0.1.1b.iso)  
* MD5 (attack_vector_alpha_0.1.1b.iso) = 99243d5f4132116e2e9606d6b0c98e6f

F.A.Q.
======
**Q: Why are you doing this/whom are you doing this for?**  
_A: My design goals were inspired by security professionals who have little time and/or money to put towards finding new tools/frameworks/configurations that would benefit them. That isn't to say this is the only group of people who will find this distro beneficial, but it is the group that I was hoping would find use in the extended tools/toolsets/configurations._

**Q: What's different about this distro, as opposed to Kali?**  
_A: One of the design goals is anonymity, which security professionals require on various job sites, especially for black-box testing. To accomplish this I took much of the TOR/TSOCKS configuration from TAILS and put it in the Kali build, including starting Vidalia with the GNOME3 window manager. I added many things at the behest of friends, including [Ronin](https://github.com/ronin-ruby/), [FakeAP](http://www.blackalchemy.to/project/fakeap/), and more. I also added a bunch of packages from the regular old Debian repos that I like to see. For a full list (more of less) of changes is listed below_

**Q: Can Tor be turned off?**  
_A: Yes, to disable Tor globally simple exit Vidalia, then run the command "/etc/init.d/polipo stop", and finally comment out the config in "/etc/apt/apt.conf.d/0000runtime-proxy" and "/etc/wgetrc". FYI, TOR does not affect anything that is not intentionally proxied through Polipo, meaning that it will not interfere with NMAP, etc._

**Q: Is this only GNOME 3, or can I switch to MATE/KDE/alternate?**  
_Kaneda: Right now I'm building for GNOME 3 specifically, but I will come out with a KDE version due to popular demand. Feel free to give your input regarding alternate window managers and I'll see what I can do._
_Thom_: I like compiz, tiling window managers, and buuf icon theme.
Here's a brainstorm:
[razor-qt](http://razor-qt.org)
[compiz](http://compiz.org)
[qtile](http://qtile.org)
[openbox](http://openbox.org)
[fluxbox](http://fluxbox.org)
[ion](http://tuomov.iki.fi/software)
I also love the Buuf icon theme:
[buuf](http://buuficontheme.free.fr)
  
**Q: One of your design goals is a Windows XP theme? (camouflage)**  
_Kaneda: This is one that's up for debate, but given Thom's insistence that we include it I will get around to it at some point in the near future._
_Thom_: Here's the link from Tails' design: [Windows Camouflage](https://tails.boum.org/doc/first_steps/startup_options/windows_camouflage/index.en.html), also: [phillips321 did it on BT5](http://www.phillips321.co.uk/2012/08/28/making-backtrack5-look-like-xp/).
  
**Q: Aren't kiddies going to use this tool to... ChaOS?!**  
_A: Probably. I'm not a lawyer. Here is an official-ish blurb: Customarily, I (@KenSoona) am not responsible for any malicious use of this tool, and I hope that releasing it and its source code engenders better information security for the community at large._


Build Instructions
==================
## Install prerequisites for Kali build. This can be done in Debian Squeeze, but we recommend starting from a Kali install:  
```
#!/bin/sh
apt-get install git live-build cdebootstrap kali-archive-keyring
cd /tmp
git clone git clone https://attackvector@bitbucket.org/attackvector/attackvector-linux.git
apt-get remove libdebian-installer4   # /* We reinstall libdebian-installer4 */
apt-get install libdebian-installer4  # /* due to a weird bug */
cd attackvector-linux/live-build-config
```
## Live build:  
```
#!/bin/sh
lb clean --purge
dpkg --add-architecture amd64
apt-get update
lb config --architecture amd64 --mirror-binary http://http.kali.org/kali --mirror-binary-security http://security.kali.org/kali-security --apt-options "--force-yes --yes"
lb build
```

#### Issue Tracker:
Please submit all requests for bugfixes and features for our next release cycle to [JIRA](https://bitbucket.org/attackvector/attackvector-linux/issues/new).  
We release under an "early, often" philosophy.

##### Target use case(s):
* Research labs targeting malware servers such as command and control servers.
* Legitimate penetration testing consulting companies needing to do black-box testing.
* `hacktivists` working within oppressive governmental regiemes.
* Academics and students working on experimental projects.
* Intelligence agencies seeking plausible deniability.

When I was asking my mentor, a computer security professor, about the ethically grey implications of the project, she replied, "You can always just call it an academic exercise."

Further Q&A ([/r/netsec](http://redd.it/1fcrjh))
========================
Q: How is this different from BackBox?

* 1.) You're right, on the surface, no difference, all this FOSS was available elsewhere (different packages and repositories). However, I'd argue:
* 2.) No one had stiched the pieces together in this particular way. I'd argue that Tails features and [design goals like these](https://tails.boum.org/doc/about/features/index.en.html#index3h2) are noble ones for a Kali fork.
* 3.) Kali's [live-build](http://docs.kali.org/live-build/live-build-a-custom-kali-iso) is designed for uses like this. Think of it as a post-install script that runs as you generate the ISO instead, so it's sorta like a pre-install? IDK

via ex-developer **@kanedasan**:  
* 1) Tor is not configured "globally". It does not break UDP scans. It is set up such that things like wget and Iceweasel use it out of the box but can easily be switched off (in the case of Iceweasel, just hit the TOR button!)
* 2) The additional tools you will find are not ones that many people know about, hence why they were not included in Kali to begin with. Further, I have received permission to distribute any and all of this software (if it did not come with a clear, legal license)
* 3) You can go and look at the build scripts: this is how the ISOs are built, feel free to build it yourself and compare the resultant contents
* 4) As stated in the FAQ, my design goals are to reach pen-testers and security professionals who do not have the time, money, and/or patience to build such a thing, and use them to get feedback regarding further innovations to this product. The immediate intent is not to aid "hacktivists working within oppressive governmental regiemes," but if it does in fact help them, then that's OK too
* 5) This is in **ALPHA STAGE**: for any and all requests please see our [JIRA](https://bitbucket.org/attackvector/attackvector-linux/issues/new)

Quotes
======
```
<muts> so basically, your project can be represented as a "live-build" recipe.
<`butane> AttackVector merges the tools of Kali and the anonymity of Tails into the scariest Linux security distribution on the internet
```

Add-ons List
============
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
* armitage
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
* metasploit
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
* thc-hydra
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
* polipo -> tor
* wget -> polipo
* apt -> polipo
* sdmem (wipes memory at shutdown/reboot)

-------------
###### social
> IRC **#AttackVector** on Freenode  
> [![Tweet This](http://ampedstatus.org/wp-content/plugins/tweet-this/icons/en/twitter/tt-twitter-micro4.png)](https://twitter.com/intent/tweet?text=%40attackvector)[![Facebook](http://richardxthripp.thripp.com/files/plugins/tweet-this/icons/tt-facebook-micro4.png)](http://facebook.com/attackVector)[![Linkedin](http://www.hollybrady.com/bradyholly/wp-content/plugins/tweet-this/icons/en/linkedin/tt-linkedin-micro4.png)](http://linkedin.com/in/attackVector)  
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
* [Help port TAILS to Wheezy](https://tails.boum.org/todo/Wheezy/)
* Evaluate features of each distro & unify them into a single kernel
* Provide two layers of functionality: [desktop](http://www.dorkfolio.net/kernel-repository) install and [live](http://www.irongeek.com/i.php?page=videos/portable-boot-devices-usb-cd-dvd)
* Evaluate features of each distro & unify them into a single kernel
* Add warning messages for anonymity risks
* Full Disk Encryption (FDE) w/ [LUKS](https://code.google.com/p/cryptsetup/)
+ on flash storage jump drive for Live Linux
+ on dedicated install with [wordlists galore](https://github.com/thomhastings/bt5-scripts/blob/master/get-wordlists.sh)
* Host on [AttackVector.org](http://attackvector.org)
* Provide documentation
* [HTTPS Everywhere](https://www.eff.org/https-everywhere)
* Debian repositories
* Continue to integrate high quality tools
* Clone the Kali repos so that AttackVector can stand-alone
+ Change live build to run off this new mirror
* Debian repositories
* Add more tools!

--------------
###### license
> [![Creative Commons License](http://i.creativecommons.org/l/by/3.0/80x15.png)](http://creativecommons.org/licenses/by/3.0/)[![Open Source](http://www.ipol.im/static/badges/open-source.png)](http://www.gnu.org/licenses/gpl.html)[![Hacker Emblem](http://catb.org/hacker-emblem/hacker.png)](http://www.catb.org/hacker-emblem/)  
> Text under [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/). Code under [GNU Public License](http://www.gnu.org/licenses/gpl.html).
