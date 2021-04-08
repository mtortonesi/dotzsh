# .zsh.d/30_aliases.zsh

# setup ls color defaults
ls --color -d . &>/dev/null 2>&1 && alias ls='ls -F --color' || alias ls='ls -FG'
# alias -- -='cd -'
# alias d='dirs -v'
# alias history='history 0'
# alias j='jobs'
# alias l.='ls -d .*'
alias ll='ls -lh'
alias la='ls -lah'
alias pu='pushd'
alias po='popd'
alias 1='cd -'
alias 2='cd +2'
alias 3='cd +3'
alias 4='cd +4'
alias 5='cd +5'
alias 6='cd +6'
alias 7='cd +7'
alias 8='cd +8'
alias 9='cd +9'
# alias sourcerc=". ~/.zsh.d/.zshrc"
# alias -g A="| ack"
# alias -g L="| less"
# alias -g X="| xargs"
# alias -g XR="| xargs -n1 unrar x"

alias xclipc='xclip -selection clipboard'

# open HTTP server in the current directory
alias server='python -m SimpleHTTPServer'

# # alias to override less
# alias less=$PAGER
# alias zless=$PAGER

# R
alias R='R --no-save --no-restore-data --quiet'

# default to advanced cp and mv if available
if test -e /usr/bin/acp
then
    alias cp='acp -gvi'
else
    alias cp='cp -vi'
fi
if test -e /usr/bin/amv
then
    alias mv='amv -gvi'
else
    alias mv='mv -vi'
fi

# default to human-friendly output for dd and df
alias df='df -h'
alias du='du -h'

# create today command that returns current date in YYYYMMDD format
alias today='date +%Y%m%d'

# make rm verbose and ask for confimation before deletion
alias rm='rm -vi'

alias bashdb='bashdb --highlight'
alias view='vim -R'

# alias for bundle install in vendor/bundle directory
alias biv='bundle install --path vendor/bundle'
