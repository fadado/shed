#!/bin/bash

clean() {
	sed 's/^...../    /'
}

build_hub() {
	echo -e '# shed-hub\n'
	../shed-hub -h | clean
	echo

	echo -e '# Commands\n'
	for cmd in build events info inspect login logout pull push query search version
	do
		echo -e "## $cmd\n"
		../shed-hub $cmd -h | clean
		echo
	done
    
} > reference-hub.md

build_image() {
	echo -e '# shed-image\n'
	../shed-image -h | clean
	echo

	echo -e '# Commands\n'
	for cmd in build commit history images import load rm save tag
	do
		echo -e "## $cmd\n"
		../shed-image $cmd -h | clean
		echo
	done
    
} > reference-image.md

build_container() {
	echo -e '# shed-container\n'
	../shed-container -h | clean
	echo

	echo -e '# General commands\n'
	for cmd in build cp create diff export links port ps rename rm status
	do
		echo -e "## $cmd\n"
		../shed-container $cmd -h | clean
		echo
	done
    
	echo -e '# Runtime commands\n'
	for cmd in attach exec kill logs pause restart run ship start stats stop top unpause wait
	do
		echo -e "## $cmd\n"
		../shed-container $cmd -h | clean
		echo
	done
    
} > reference-container.md

build_volume() {
	echo -e '# shed-volume\n'
	../shed-volume -h | clean
	echo

	echo -e '# Commands\n'
	for cmd in create inspect ls rm
	do
		echo -e "## $cmd\n"
		../shed-volume $cmd -h | clean
		echo
	done
    
} > reference-volume.md

build_network() {
	echo -e '# shed-network\n'
	../shed-network -h | clean
	echo

	echo -e '# Commands\n'
	for cmd in connect create disconnect inspect ls rm
	do
		echo -e "## $cmd\n"
		../shed-network $cmd -h | clean
		echo
	done
    
} > reference-network.md

if (( $# == 0 ))
then
	build_hub
	build_image
	build_container
	build_volume
	build_network
else
	for r; do build_$r; done
fi

exit
