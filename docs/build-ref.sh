#!/bin/bash

clean() {
	sed 's/^...../    /'
}

build_hub() {
	echo -e '# shed-hub\n'
	shed-hub -h | clean
	echo

	echo -e '# Commands\n'
	for cmd in build events info inspect login logout pull push query search version
	do
		echo -e "## $cmd\n"
		shed-hub $cmd -h | clean
		echo
	done
    
} > reference-hub.md

build_image() {
	echo -e '# shed-image\n'
	shed-image -h | clean
	echo

	echo -e '# Commands\n'
	for cmd in build commit history images import list load purge rm save tag
	do
		echo -e "## $cmd\n"
		shed-image $cmd -h | clean
		echo
	done
    
} > reference-image.md

build_container() {
	echo -e '# shed-container\n'
	shed-container -h | clean
	echo

	echo -e '# General commands\n'
	for cmd in build cp create diff export links list port ps rename rm status
	do
		echo -e "## $cmd\n"
		shed-container $cmd -h | clean
		echo
	done
    
	echo -e '# Runtime commands\n'
	for cmd in attach enter exec kill logs pause restart run ship start stats stop top unpause wait
	do
		echo -e "## $cmd\n"
		shed-container $cmd -h | clean
		echo
	done
    
} > reference-container.md

if (( $# == 0 ))
then
	build_hub
	build_image
	build_container
else
	for r; do build_$r; done
fi

exit
