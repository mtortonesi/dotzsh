# .zsh.d/30_aliases.zsh

ls --color -d . &>/dev/null 2>&1 && alias ls='ls -F --color' || alias ls='ls -FG'
alias _='sudo'
alias -- -='cd -'
alias ^L='clear'
alias a="$(whence ack-grep || whence ack) --nocolor"
alias ack="$(whence ack-grep || whence ack) --nocolor"
alias awk="$(whence gawk || whence awk)"
alias d='dirs -v'
alias c='calc -d'
alias history='history 0'
alias j='jobs'
alias l='ls -la'
alias l.='ls -d .*'
alias ll='ls -l'
alias m='mplayer'
alias pgrep='pgrep -L'
alias pu='pushd'
alias po='popd'
alias rm='rm -i'
alias sfv="cksfv -g *.sfv"
alias sourcerc=". ~/.zsh.d/.zshrc"

alias -g A="| ack"
alias -g L="| less"
alias -g X="| xargs"
alias -g XR="| xargs -n1 unrar x"

alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'

# R
alias R='R --no-save --no-restore-data --quiet'

# radio streams
alias bbc="mplayer -cache-min 4 -playlist \
http://www.bbc.co.uk/worldservice/meta/tx/nb/live_news_au_nb.ram"
alias kqed="mplayer -cache-min 4 \
            http://kqed-ice.streamguys.org:80/kqedradio-ew-e1"
alias ipr="mplayer -cache-min 4 http://voxsc1.somafm.com:8070"
alias mpr="mplayer -cache-min 4 http://newsstream1.publicradio.org:80/"
alias npr="mplayer -cache-min 4 http://npr.ic.llnwd.net/stream/npr_live24"

# OS-specific settings
function alias_BSD() {
    alias ls="ls -FG"
}

function alias_GNU() {
    alias ls="ls -F --color"
}

case $UNAME in
    Darwin) alias_BSD ;;
    FreeBSD) alias_BSD ;;
    Linux) alias_GNU ;;
esac
