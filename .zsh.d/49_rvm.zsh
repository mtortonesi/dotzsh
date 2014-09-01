# .zsh.d/49_rvm.zsh

if [ -d "$HOME/.rvm" ]; then
  # make sure you have a default set in rvm, or this won't work
  function ruby_prompt_string {
    local current=$(rvm-prompt)
    local default=$(rvm list default string)
    if [[ "$current" != "$default" ]]
    then
      local interpreter=${current#ruby-}
      if [[ -n "$interpreter" ]]
      then
        print -n "$interpreter "
      fi
    fi
  }
elif [ -d "$HOME/.rbenv" ]; then
  function ruby_prompt_string {
    local interpreter=$(rbenv version-name)
    if [[ -n "$interpreter" && "$interpreter" != "system" ]]
    then
        print -n "$interpreter "
    fi
  }
fi
