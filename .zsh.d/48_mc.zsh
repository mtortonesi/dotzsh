# Setup alias for midnight commander
# 1) use mc-wrapper script if available (as it allows mc to remember the last
#    directory it was used from)
# 2) use -u option to tell mc not to launch a concurrent shell (doing it
#    wouldn't play well with powerlevel10k and more in general with zsh fancy
#    prompts and could lead to unpleasant misbehaviors including hang on startup)
if [ -f /usr/lib/mc/mc-wrapper.sh ]; then
    alias mc='. /usr/lib/mc/mc-wrapper.sh -u'
elif [ -f /usr/local/bin/brew -a -f /usr/local/bin/jq ]; then
    mc_version=`brew info --json=v1 mc | jq -r '.[].installed | max_by(.version) .version'`
    if [ -f "/usr/local/Cellar/midnight-commander/${mc_version}/libexec/mc/mc-wrapper.sh" ]; then
      alias mc=". /usr/local/Cellar/midnight-commander/${mc_version}/libexec/mc/mc-wrapper.sh -u"
    fi
else
    alias mc='mc -u'
fi
