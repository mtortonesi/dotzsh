if [ ! -z $(which exa) ]
then
	export EXA_COLORS="da=36:sn=35;1:sb=35:uu=38;5;184:gu=38;5;184"

	alias ll='exa -lhg --git'
	alias la='exa -lhga --git'
fi
