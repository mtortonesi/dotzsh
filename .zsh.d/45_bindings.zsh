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

bindkey '^R' history-incremental-search-backward # Fix Ctrl-R
# bindkey '^[[1~' beginning-of-line # Fix Home key
# bindkey '^[[8~' end-of-line       # Fix End key
