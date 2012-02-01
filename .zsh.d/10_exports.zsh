# .zsh.d/10_exports.zsh

export HOST="$(hostname)"
export HOST="${HOST%%.*}"
export LESSOPEN="|lesspipe.sh %s"
export LS_COLORS='di=32:fi=0:ln=35:pi=5:so=5:bd=5:cd=5:or=31'
export LSCOLORS="cxfxcxdxbxegedabagacad"
export PAGER='less'
export READNULLCMD='cat'
export UNAME="$(uname)"

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR='vim'
export GIT_EDITOR='vim'

# Search in ~/bin and ~/opt/node.js/bin first, then in PATH
if [ -d ~/opt/node.js ]
then
  export NODE_PATH="$HOME/opt/node.js"
  PATH="$NODE_PATH/bin:$PATH"
fi

export PATH="$HOME/bin:$PATH"
