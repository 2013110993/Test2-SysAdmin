#!/bin/bash

function my-lookup(){
	#User must provide 2 arguments to run script
	local text_File="$1"
	local lastname="$2"


	#Checks if arguments exist and also if its a text file
	if [ ! -z "$text_File" ] && [ ! -z "$lastname" ] && [[ $text_File == *".txt" ]]; then 
		#Relative to HOME directory
		local textfile="$HOME/$text_File"

		#Checks for file
		if [ -f "$textfile" ]; then
			echo -e "\nMatches:"
			# Match the name to regex
			grep -P "^(?:[a-zA-Z]+ )*(?:$lastname)$" $textfile
			echo -e "\nGoodby!"
		else
			#else if does exist display error

			echo -e "\n\0333[0;31m$textfile does not exist\n\n\033[0;32mProvide text file to search for name."
		fi
	else
		echo -e "\033[0;31m\n\nTwo arguments are needed for this script to work.\n\033[0;32mCommand: my-lookup <textfile> <last name to search>"

	fi
}

