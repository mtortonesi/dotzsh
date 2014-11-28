# .zsh.d/45_bindings.zsh

# Set vi mode
bindkey -v


# Enable support for command line manipulation through external editor
autoload -z edit-command-line
zle -N edit-command-line

# Esc+v opens current command line in the default editor
bindkey -M vicmd v edit-command-line


# Fix backspace key
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char


# Fix history search

# 1. Enter search mode using ? or /
bindkey -M vicmd '?' history-incremental-pattern-search-backward
bindkey -M vicmd '/' history-incremental-pattern-search-forward

# 2. Use Ctrl-P and Ctrl-N cycle through all matches
bindkey -M viins '^P' history-incremental-pattern-search-backward
bindkey -M viins '^N' history-incremental-pattern-search-forward


# Setup prompt
# (See also http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode)

# Setup the strings to display in viins and vicmd mode respectively
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[yellow]%}[CMD]%{$reset_color%}"

# Set up initial value for vim_mode (zsh starts in viins mode)
vim_mode=$vim_ins_mode

# Update the content of vim_mode and reset prompt upon keymap switch
function zle-keymap-select {
    vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
    zle reset-prompt
}
zle -N zle-keymap-select

# Reset vim_mode to viins mode upon enter
function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode
# indicator, while in fact you would be in INS mode
#
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the
# SIGINT, so if anything else depends on it, we will not break it
#
# See http://paulgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

# Install vim mode display setup in right prompt
RPROMPT='${vim_mode}'

# NOTE: Still need to get this work with multiline prompt. See also
# http://unix.stackexchange.com/questions/547/make-my-zsh-prompt-show-mode-in-vi-mode
# https://vinipsmaker.wordpress.com/2014/02/23/my-zsh-config/
# for more information.
# setopt transient_rprompt
# RPROMPT2='${vim_mode}'
