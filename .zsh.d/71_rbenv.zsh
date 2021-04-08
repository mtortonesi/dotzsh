# Add RBENV to PATH
if [ -d ~/.rbenv ]; then
  PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
