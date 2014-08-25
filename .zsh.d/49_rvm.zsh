# .zsh.d/49_rvm.zsh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# make sure you have a default set in rvm, or this won't work
function rvm_prompt_string {
    local current=$(rvm-prompt)
    local default=$(rvm list default string)
    if [[ "$current" != "$default" ]]
    then
        interpreter=${current#ruby-}
        if [[ -n $interpreter ]]
        then
          print -n "$interpreter "
        fi
    fi
}

