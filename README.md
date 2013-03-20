bulk-usenet
===========
description:
------------
just a simple bash script for mass uploading to usenet with newsmangler, probably a better way out there, but hey it works.


Requirements:
-------------
* a usenet account (that allows posting)
* [newsmangler](https://github.com/madcowfred/newsmangler) for doing the actual posting, and properly configured.
* a good yenc encoder for newsmangler, like [yenc-freddie](https://github.com/thebananafish/yenc-freddie)
* par2 and rar ( apt-get install rar par2)

How this works:
---------------
1.  clone into this project and modify the location of newsmangler
2.  chmod +x bulk-use.sh
3.  go into the directory with the directories you would like to post.
4.  ./bulk-use.sh


this script will ask you for a prefix, this prefix is different from the global one in ~.newsmangler.conf this one will be appended to the folder it creates for posting as well.
