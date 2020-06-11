# .zsh.d/45_bindings.zsh

# Set vi mode
bindkey -v


# Fix Home and End on the goddamned MacOS
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line


# Snappier response to <ESC> key presses (0.1 instead of 0.4 seconds)
export KEYTIMEOUT=1


# Enable support for command line manipulation through external editor
autoload -z edit-command-line

# Creates a widget called edit-command-line
zle -N edit-command-line

# Esc+v opens current command line in the default editor
# (by calling the edit-command-line widget)
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


# Enable vim-surround like functions for command line editing
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -a cs change-surround
bindkey -a ds delete-surround
bindkey -a ys add-surround
bindkey -M visual S add-surround


# Setup automatic quoting of special characters when entering a URL 
# in the command line
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

