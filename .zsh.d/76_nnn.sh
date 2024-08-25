if [[ ! -z `which nnn` ]]
then
	# Enable embedded vi for editing, type-to-nav, and selection to clipboard
	export NNN_OPTS="enx" 
	export NNN_PLUG="c:fzcd;o:fzopen"
fi
