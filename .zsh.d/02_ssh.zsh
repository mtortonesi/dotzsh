if [ -f /usr/bin/ksshaskpass ]
then
  export SSH_ASKPASS="/usr/bin/ksshaskpass"
  eval $(keychain --eval --quiet id_rsa)
fi
