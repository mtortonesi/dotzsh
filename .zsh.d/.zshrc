################################################################################
# HOMEBREW
################################################################################
if [[ $(uname) = 'Darwin' ]]
then
    # Enable Homebrew
    eval $(/opt/homebrew/bin/brew shellenv)
fi


################################################################################
# ENVIRONMENT VARIABLES AND OPTIONS
################################################################################

export UNAME="$(uname)"

# Set favourite text editor
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL='nvim'

# Auto scale QT applications (fix for HiDPI displays)
export QT_AUTO_SCREEN_SCALE_FACTOR=1


# Set umask to 022
umask 022

# History
export HISTSIZE=5000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
export WORDCHARS=''
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Turn extended globbing on
setopt EXTENDED_GLOB
setopt NO_BEEP

# setopt ALL_EXPORT
# setopt ALWAYS_TO_END
# setopt AUTO_CD
# setopt AUTO_NAME_DIRS
# setopt BRACE_CCL
# setopt COMPLETE_IN_WORD
# setopt NOMATCH
# setopt NOTIFY
# setopt PROMPT_SUBST
# setopt RM_STAR_SILENT


################################################################################
# ALIASES
################################################################################

alias xclipc='xclip -selection clipboard'

# Start R quietly
alias R='R --no-save --no-restore-data --quiet'

# Default to human-friendly output for dd and df
alias df='df -h'
alias du='du -h'

# Create today command returning current date in YYYYMMDD format
alias today='date +%Y%m%d'

# Ask for confimation before deletion
alias rm='rm -i'

# Add alias to force bundle install gems in vendor/bundle directory
# alias biv='bundle install --path vendor/bundle'
alias bsv='bundle config set --local path vendor/bundle'

# Streamline setting the title of the terminal tab
alias wst='wezterm cli set-tab-title'


################################################################################
# COLORS FOR LS AND EZA
################################################################################

# Setup color defaults for ls
ls --color -d . &>/dev/null 2>&1 && alias ls='ls -F --color' || alias ls='ls -FG'
export LS_COLORS="di=1;94:ex=1;32:ln=93:or=31"
#                 ^       ^       ^     ^
#                 |       |       |     |
#                 |       |       |     orphan symlinks are red
#                 |       |       symlinks are yellow
#                 |       executables are bold green
#                 directories are bold light blue

# Setup color defaults for eza and ll and la shortcuts
if [ ! -z $(which eza) ]
then
	export EXA_COLORS="da=36:sn=35;1:sb=35:uu=38;5;184:gu=38;5;184:xx=38;5;243"
	#                  ^     ^       ^     ^           ^           ^
	#                  |     |       |     |           |           |
	#                  |     |       |     |           |           punctuation is dark grey
	#                  |     |       |     |           current group is yellow
	#                  |     |       |     current user is yellow
	#                  |     |       file size unit is magenta
	#                  |     file size is magenta bold
	#                  date is light blue

	alias ll='eza -lhg --git'
	alias la='eza -lhga --git'
else
	alias ll='ls -lh'
	alias la='ls -lah'
fi


################################################################################
# ZSH MODULES
################################################################################

# Enable zargs, a superior alternative to xargs
autoload -U zargs

# Enable the super powerful zmv file renaming builtin tool
autoload -U zmv
alias zcp='zmv -C'
alias zln='zmv -L'


################################################################################
# ZSH COMPLETION
################################################################################

# First try the usual completion and, if nothing matches, try to correct and
# then to approximate
zstyle ':completion:::::' completer _complete _correct _approximate
# Try spelling correction: 2 errors allowed, numeric arguments are ignored
zstyle ':completion:*:correct:::' max-errors 2 not-numeric
# Try approximate completion: 3 errors allowed, also consider numeric arguments
zstyle ':completion:*:approximate:::' max-errors 3 numeric

# Provide verbose completion information
zstyle ':completion:*' verbose true 

# First try the usual completion and, if nothing matches, to try a
# case-insensitive completion. Also, try to complete partial words.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# In case of ambiguity in partial completion, list all possible completions
# (In fact, a command such as "cd c/g/r<TAB>" could expand to "cd
# code/git/reinforce" but also to "cd code/gsomething/rsomething".)
zstyle ':completion:*' list-suffixes
# Try to complete as much as possible of the prefix and the suffix of the
# ambiguous arguments
zstyle ':completion:*' expand prefix suffix 

# Use LS_COLORS defined colors for completion of file names
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Disable menu completion and use fzf-tab instead
zstyle ':completion:*' menu no
# Preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# Switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# Complete manuals by their section
zstyle ':completion:*:manuals'   separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true
zstyle ':completion:*:man:*'     menu yes select

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


################################################################################
# ZSH KEYBINDINGS
################################################################################

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


################################################################################
# OS SPECIFIC CONFIGURATION
################################################################################

if [[ $(uname) = 'Darwin' ]]
then 
    ###########################################################################
    # Homebrew warning:
    ###########################################################################
    # ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed
    # and these are never upgraded.
    # To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the
    # following to your ~/.zshrc:
    ###########################################################################
    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

    ###########################################################################
    # Add llvm installation directory to pach (to use clangd for LSP purposes)
    ###########################################################################
    [[ -x "/usr/local/opt/llvm/bin" ]] && PATH="${PATH}:/usr/local/opt/llvm/bin"
else
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
fi


################################################################################
# OH MY POSH AND ZOXIDE
################################################################################

# Enable Oh My Posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/mauro.toml)"

# Activate zoxide
eval "$(zoxide init zsh)"


################################################################################
# EXTRAS
################################################################################

# Load all the files in $ZDOTDIR
for file in $ZDOTDIR/??_*~(*disabled|*~); do
  . $file
done
