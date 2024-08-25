# .zsh.d/15_options.zsh

umask 022

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
WORDCHARS=''
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# setopt ALL_EXPORT
# setopt ALWAYS_TO_END
# setopt AUTO_CD
# setopt AUTO_NAME_DIRS
# setopt AUTO_PUSHD
# setopt BRACE_CCL
# setopt COMPLETE_IN_WORD
# # setopt EXTENDED_HISTORY
# setopt EXTENDED_GLOB
# setopt NOMATCH
# setopt NOTIFY
# setopt PROMPT_SUBST
# setopt PUSHD_IGNORE_DUPS
# setopt RM_STAR_SILENT

setopt NO_BEEP
