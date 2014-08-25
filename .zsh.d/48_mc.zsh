# alias for midnight commander
if [ -f /usr/lib/mc/mc-wrapper.sh ]
then
    alias mc='. /usr/lib/mc/mc-wrapper.sh'
fi

if [ -f $HOME/.local/share/mc/skins/solarized.ini ]
then
    export MC_SKIN=$HOME/.local/share/mc/skins/solarized.ini
fi

