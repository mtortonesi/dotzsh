# colorized man pages
# borrowed from https://blog.yossarian.net/2018/01/22/Reading-Manpages-Like-a-Pro

# LESS_TERMCAP_mb blinking mode (not common in manpages)
# LESS_TERMCAP_md double-bright mode (used for boldface)
# LESS_TERMCAP_me exit/reset all modes
# LESS_TERMCAP_so enter standout mode (used by the less statusbar and search results)
# LESS_TERMCAP_se exit standout mode
# LESS_TERMCAP_us enter underline mode (used for underlined text)
# LESS_TERMCAP_ue exit underline mode
cman() {
    env \
    LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
    LESS_TERMCAP_md="$(printf "\e[1;36m")" \
    LESS_TERMCAP_me="$(printf "\e[0m")" \
    LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
    LESS_TERMCAP_se="$(printf "\e[0m")" \
    LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    LESS_TERMCAP_ue="$(printf "\e[0m")" \
    man "${@}"
}
