# .zsh.d/49_rvm.zsh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function rvm_prompt_string {
    local current=$(rvm-prompt)
    local default=$(rvm list default string)
    if ! [[ "$current" = "$default" ]]
    then
        print -n "${current#ruby-} "
    fi
}

