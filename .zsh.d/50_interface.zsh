# .zsh.d/50_interface.zsh

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{magenta}[%f%b%F{magenta}]%c%u%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' %B%F{yellow}⚡%f%b'
zstyle ':vcs_info:git:*' unstagedstr ' %B%F{red}⚡%f%b'

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


# Begin in -- INSERT -- vi mode
RPS1="%B%F{yellow}-- INSERT --%f%b"

# Update vi mode
function zle-line-init zle-keymap-select {
    RPS1="%B%F{yellow}${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}%f%b"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
