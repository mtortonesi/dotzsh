# .zsh.d/45_bindings.zsh

# Set vi mode
bindkey -v

# Fix key bindings
bindkey '^?' backward-delete-char # Fix backspace key
bindkey '^R' history-incremental-search-backward # Fix Ctrl-R
bindkey '^[[7~' beginning-of-line # Fix Home key
bindkey '^[[8~' end-of-line       # Fix End key
