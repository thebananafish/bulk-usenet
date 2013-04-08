#!/bin/bash
#now we are getting fancy!
#Posting to usenet script
#this script takes every directory in a directory, rars them, pars them and then posts to usenet.  
#It is a little messy, but hey it works.

###check if proper programs are installed
gotrar=(which rar)
gotpar=(which par2create)

if [ "$gotrar" = "" ];
	then
		echo "Rar was not found, debian? add non-free repo and apt-get install rar"
		exit0
fi

if [ "$gotpar" = "" ];
	then
		echo "Par2 was not found, debian? apt-get install par2"
		exit0
fi

### ask for stuff                   
echo "are we posting [f]iles or [d]irectories"
read method
echo "please enter a prefix for posting:"
read prefix
echo "do you want to cleanup after we are posting? [Y] or [N]"
read clean
###
#####
#method for posting files
if [ "$method" = 'f' ]
	then
		echo "files selected, please enter the file extension to look for:"
		read file_ext
		for file in ./*.$file_ext; do
		rar a "$file".rar -v15m -m0 "$file"
		par2create -r10 -n7 "$file" "$file*.rar"
		#ok this is weird but required to make the folder right
		file2="${file:2}"
		mkdir "$prefix $file2"
		mv "$file".* "$prefix $file2"
		python /home/nick/newsmangler/mangler.py "$prefix $file2"
		echo "$prefix $file2 has been posted!"
		done

fi
#####
#method for posting folders
if [ "$method" = 'd' ]
	then
		echo "all folders in directory selected, here we go!"
		for dir in */
		do
	        base=$(basename "$dir")
        	rar a "${base}" -v15m -m0 "$dir"
        	par2create -r10 -n7 "${base}" "${base}*.rar"
        	mkdir "$prefix $dir"
		mv "${base}".* "$prefix $dir"
		python /home/nick/newsmangler/mangler.py "$prefix $dir"
		echo "$prefix $dir has been posted!"
		done
fi

if [ "$clean" = 'y' ]
		then
		rm -r "$prefix *"
fi

