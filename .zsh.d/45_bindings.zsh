# .zsh.d/45_bindings.zsh

# bindkey -e
# bindkey ' ' magic-space
# bindkey '^Xe' edit-command-line

# Set vi mode
bindkey -v

# Fix key bindings
bindkey '^?' backward-delete-char # Fix backspace key
bindkey '^R' history-incremental-search-backward # Fix Ctrl-R
bindkey '^[[7~' beginning-of-line # Fix Home key
bindkey '^[[8~' end-of-line       # Fix End key

# Begin in -- INSERT -- vi mode
RPS1="%B%F{yellow}-- INSERT --%f%b"

# Update vi mode
function zle-line-init zle-keymap-select {
    RPS1="%B%F{yellow}${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}%f%b"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
