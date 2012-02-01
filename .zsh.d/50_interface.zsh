# .zsh.d/50_interface.zsh

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{magenta}[%f%b%F{magenta}]%c%u%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' %F{blue}⚡%f'
zstyle ':vcs_info:git:*' unstagedstr ' %F{blue}⚡%f'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


PS1='%B%F{red}%m%f %F{green}$(rvm_prompt_string)%f%F{cyan}%3~%f%b${vcs_info_msg_0_}%f '

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

function chpwd { ls }
function precmd { vcs_info; title "zsh" "%~" }
function preexec { title "$1" }
