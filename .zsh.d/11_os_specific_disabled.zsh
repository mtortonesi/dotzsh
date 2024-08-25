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
