# .zsh.d/35_completions.zsh

# The following lines were added by compinstall:
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
# zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
# End of lines added by compinstall

# Provide verbose completion information
zstyle ':completion:*' verbose true 

# First try the usual completion and, if nothing matches, to try a
# case-insensitive completion. Also, try to complete partial words.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Use LS_COLORS defined colors for completion of file names
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Disable menu completion and use fzf-tab instead
zstyle ':completion:*' menu no
# Preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# Switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# # Complete manuals by their section
# zstyle ':completion:*:manuals'   separate-sections true
# zstyle ':completion:*:manuals.*' insert-sections   true
# zstyle ':completion:*:man:*'     menu yes select

# Remove trailing slash when using directory as argument
zstyle ':completion:*' squeeze-slashes true

# Force cd never to select the parent directory (cd ../<TAB>)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Setup cache for completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh.d/cache


# Add zsh-completions to FPATH
if type brew &> /dev/null
then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# Initialize completions
autoload -Uz compinit && compinit

# Enable fzf-tab plugin
source "${XDG_DATA_HOME:-${HOME}/.local/share}/fzf-tab/fzf-tab.zsh"

# Enable zsh-autosuggestions plugin
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable zsh-fast-syntax-highlighting plugin
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# complist is the completion listing extensions module
# Among other things, it gives access to the keymap menuselect, to customize
# the menu selection during completion, including how to select what you want.
zmodload zsh/complist

# compctl -g '*(-/D)' cd
# compctl -g '*(-/)' mkdir
# compctl -j kill
# compctl -c which
# compctl -c sudo
# compctl -v export
# compctl -o setopt unsetopt
# # compctl -g "* (-/D)" + -g "*.class(.:r)" java
# # compctl -g '*.zip' + -g '*(-/)' unzip
# # compctl -g '*.mp3 *.ogg *.mod *.wav *.avi *.mpg *.mpeg *.wmv' + -g '*(-/)' mplayer

# # complete process ID's with menu selection
# zstyle ':completion:*:*:kill:*' menu yes select
# zstyle ':completion:*:kill:*'	force-list always
