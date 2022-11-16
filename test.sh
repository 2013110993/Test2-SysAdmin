############################################
# CMPS4232 - Systems Administration
# Federico Rosado
# Test 2
###########################################

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

			echo -e "\n$textfile does not exist; Provide text file to search for name."
		fi
	else
		echo -e "\n\nTwo arguments are needed for this script to work.\n\n"
		echo -e "Command: my-lookup <textfile> <last name to search>\n"

	fi
}

