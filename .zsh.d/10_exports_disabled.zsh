# .zsh.d/10_exports.zsh

# export PAGER='vimpager'
# export READNULLCMD='cat'
export UNAME="$(uname)"

# Set favourite text editor
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL='nvim'

# Auto scale QT applications (fix for HiDPI displays)
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Add ~/bin directory to PATH
if [ -d ~/bin ]
then
  PATH="$HOME/bin:$PATH"
fi

export PATH
