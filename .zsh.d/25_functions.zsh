# .zsh.d/25_functions.zsh

# '...' => '../..' and so on...
rationalise-dot() {
    local MATCH
    if [[ $LBUFFER =~ '(^|/| |	|'$'\n''|\||;|&)\.\.$' ]]; then
        LBUFFER+=/
        zle self-insert
        zle self-insert
    else
        zle self-insert
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert 2>/dev/null

# automatic rehash on command completion
_force_rehash() {
    (( CURRENT == 1 )) && rehash
    return 1
}

zstyle ':completion:*' completer \
    _oldlist _expand _force_rehash _complete ...

# ssh-agent
function start_agent {
   echo "Initializing new SSH Agent..."
   /usr/bin/ssh-agent | sed 's/^echo/#echo/' >! ${SSH_ENV}
   chmod 600 ${SSH_ENV}
   . ${SSH_ENV} > /dev/null
   /usr/bin/ssh-add;
}
