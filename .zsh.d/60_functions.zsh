# Make directory and cd inside it
function mkcd {
    mkdir -p "$*"
    cd "$*"
}

# Setup alias for midnight commander
# 1) use mc-wrapper script if available (as it allows mc to remember the last
#    directory it was used from)
# 2) use -u option to tell mc not to launch a concurrent shell (doing it
#    wouldn't play well with powerlevel10k and more in general with zsh fancy
#    prompts and could lead to unpleasant misbehaviors including hang on startup)
function mc {
    if [ -f /usr/lib/mc/mc-wrapper.sh ]; then
        . /usr/lib/mc/mc-wrapper.sh -u
    elif [[ $(command -v brew) != "" ]]; then
        . $(brew --prefix mc)/libexec/mc/mc-wrapper.sh -u
    else
        mc -u
    fi
}

