#!/bin/bash

#Posting to usenet script
#Explain: this script takes every directory in a directory, rars them, pars them and then posts to usenet.  It is a little messy, but hey it works.


echo "please enter a prefix!:"
read prefix
for dir in */
do

        base=$(basename "$dir")
        rar a "${base}" -v15m -m0 "$dir"
        par2create -r10 -n7 "${base}" ${base}*.rar
        mkdir "$prefix $dir"
	mv "${base}".* "$prefix $dir"
	python /home/user/newsmangler/mangler.py "$prefix $dir"

echo "$prefix $dir has been posted!"

done
