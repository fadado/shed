#!/bin/bash

time for img in $(find -maxdepth 1 -type d | sort); do
	[[ $img == . ]] && continue
	[[ ! -e $img/Shedfile ]] && continue
	echo -e "\n>>>> Building ${img#./} <<<<"
	cd $img
	make build
	cd ..
done

exit

# vim:syntax=sh:ai:sw=4:ts=4
