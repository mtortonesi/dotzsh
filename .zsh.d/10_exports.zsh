# .zsh.d/10_exports.zsh

export EXA_COLORS="da=36:sn=35;1:sb=35:uu=38;5;184:gu=38;5;184"
# export PAGER='vimpager'
export READNULLCMD='cat'
export UNAME="$(uname)"

# Set favourite text editor
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL='nvim'

# Auto scale QT applications (fix for HiDPI displays)
export QT_AUTO_SCREEN_SCALE_FACTOR=1

# Add Android SDK tools to PATH if needed
if [ -d /opt/android-sdk/tools ]
then
  PATH="/opt/android-sdk/tools:$PATH"
fi
if [ -d /opt/android-sdk/platform-tools ]
then
  PATH="/opt/android-sdk/platform-tools:$PATH"
fi

# Prepend /usr/local/bin to everything else on OSX
# (we want homebrew's vim to have precedence over system's default obsolete and
# clipboard-cripped one)
if [ $(uname) = "Darwin" ]
then
  # substitute : -> ' ', remove /usr/local/bin from path, and split into array
  array=(${=${${PATH//:/ }/\/usr\/local\/bin/}})
  PATH="/usr/local/bin:${(j.:.)array}"
fi

# Add ~/bin directory to PATH
if [ -d ~/bin ]
then
  PATH="$HOME/bin:$PATH"
fi

# Try to get perl5 working
if [ -d ~/perl5 ]
then
  eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`
fi

# Add Rust stuff to PATH
if [ -d ~/.cargo/bin ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

# Add RBENV to PATH
if [ -d ~/.rbenv ]; then
  PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

export PATH
