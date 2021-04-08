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
    # Setup ~/opt as a directory where to install miscellaneous utilities (such
    # as nnn)
    ###########################################################################
    export PATH="${PATH}:${HOME}/opt/bin"
    export MANPATH="$(manpath):${HOME}/opt/man"

    # # Prepend /usr/local/bin to everything else on OSX
    # # (we want homebrew's vim to have precedence over system's default obsolete and
    # # clipboard-cripped one)
    # if [ $(uname) = "Darwin" ]
    # then
    #   # substitute : -> ' ', remove /usr/local/bin from path, and split into array
    #   array=(${=${${PATH//:/ }/\/usr\/local\/bin/}})
    #   PATH="/usr/local/bin:${(j.:.)array}"
    # fi
else
    alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
fi
