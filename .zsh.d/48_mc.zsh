# alias for midnight commander
if [ -f /usr/lib/mc/mc-wrapper.sh ]; then
    alias mc='. /usr/lib/mc/mc-wrapper.sh'
elif [ -f /usr/local/bin/brew -a -f /usr/local/bin/jq ]; then
    mc_version=`brew info --json=v1 mc | jq -r '.[].installed | max_by(.version) .version'`
    if [ -f "/usr/local/Cellar/midnight-commander/${mc_version}/libexec/mc/mc-wrapper.sh" ]; then
      alias mc=". /usr/local/Cellar/midnight-commander/${mc_version}/libexec/mc/mc-wrapper.sh"
    fi
fi

if [ -n "$SOLARIZED" -a -f $HOME/.local/share/mc/skins/solarized.ini ]; then
    export MC_SKIN=$HOME/.local/share/mc/skins/solarized.ini
fi

## disable right prompt inside midnight commander
## (taken from http://www.zsh.org/mla/users/2013/msg00402.html)
#if [[ $+MC_SID = 1 ]] ; then
#    RPROMPT=""
#fi
