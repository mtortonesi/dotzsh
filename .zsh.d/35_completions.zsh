# .zsh.d/35_completions.zsh

zmodload zsh/complist
autoload -U compinit && compinit

compctl -K screen-sessions screen
compctl -g '*(-/D)' cd
compctl -g '*(-/)' mkdir
compctl -j kill
compctl -c which
compctl -c sudo
compctl -v export
compctl -o setopt unsetopt
compctl -g "* (-/D)" + -g "*.class(.:r)" java
compctl -g '*.par2' + -g '*(-/)' par2
compctl -g '*.r01 *.part01.rar *.rar' + -g '*(-/)' unrar
compctl -g '*.zip' + -g '*(-/)' unzip
compctl -g '*.mp3 *.ogg *.mod *.wav *.avi *.mpg *.mpeg *.wmv' + -g '*(-/)' mplayer

# cache completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh.d/cache

# fuzzy matching of completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# complete process ID's with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'	force-list always

# remove trailing slash when using directory as argument
zstyle ':completion:*' squeeze-slashes true

# cd will never select the parent directory (cd ../<TAB>)
zstyle ':completion:*:cd:*' ignore-parents parent pwd

function screen-sessions {
   typeset -a sessions
   for i in /tmp/screens/S-${USER}/*(p:t);  do
      sessions+=(${i#*.})
   done

   reply=($sessions)
}
