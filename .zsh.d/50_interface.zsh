# .zsh.d/50_interface.zsh

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats " %{$fg[magenta]%}[%{$reset_color%}%{$fg_bold[magenta]%}%b%{$reset_color%}%{$fg[magenta]%}]%{$reset_color%}%c%u"
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' %F{yellow}S%f'
zstyle ':vcs_info:git:*' unstagedstr ' %F{red}U%f'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

if typeset -f ruby_prompt_string > /dev/null
then
  PS1='%F{red}%m%f %F{cyan}$(ruby_prompt_string)%f%F{green}%2~%f${vcs_info_msg_0_} '
else
  # no rvm or rbenv installed
  PS1='%F{red}%m%f %F{green}%2~%f${vcs_info_msg_0_} '
fi

function title {
    local value="${${${(V)1//\%/\%\%}//'\n'/; }//'\t'/ }"
    value="%70>...>$value%<<"

    case $TERM in
        screen)
            print -Pn "\ek${value}\e\\"
            print -Pn "\e_${location}\e\\"
            ;;
        xterm*)
            if [[ -z $SSH_TTY ]]; then
                print -Pn "\e]0;$value $2\a"
            else
                print -Pn "\e]0;$value@$HOST $2\a"
            fi
            ;;
    esac
}

# function chpwd { ls }
function precmd { vcs_info; title "zsh" "%~" }
function preexec { title "$1" }
