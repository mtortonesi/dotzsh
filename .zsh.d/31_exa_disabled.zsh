export LS_COLORS="di=1;94:ex=1;32:ln=93:or=31"
#                 ^       ^       ^     ^
#                 |       |       |     |
#                 |       |       |     orphan symlinks are red
#                 |       |       symlinks are yellow
#                 |       executables are bold green
#                 directories are bold light blue

if [ ! -z $(which eza) ]
then
	export EXA_COLORS="da=36:sn=35;1:sb=35:uu=38;5;184:gu=38;5;184:xx=38;5;243"
	#                  ^     ^       ^     ^           ^           ^
	#                  |     |       |     |           |           |
	#                  |     |       |     |           |           punctuation is dark grey
	#                  |     |       |     |           current group is yellow
	#                  |     |       |     current user is yellow
	#                  |     |       file size unit is magenta
	#                  |     file size is magenta bold
	#                  date is light blue

	alias ll='eza -lhg --git'
	alias la='eza -lhga --git'
fi
