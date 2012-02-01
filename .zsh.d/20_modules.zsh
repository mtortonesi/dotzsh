# .zsh.d/20_modules.zsh

autoload -U colors && colors
autoload -U edit-command-line
autoload -U url-quote-magic

autoload -U vcs_info
autoload -U zargs
autoload -U zcalc
autoload -U zmv

zle -N self-insert url-quote-magic
zle -N edit-command-line
