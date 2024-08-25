if [[ ! -z `which jenv` ]]
then
	eval export PATH="${HOME}/.jenv/shims:${PATH}"
	export JENV_SHELL=zsh
	export JENV_LOADED=1
	unset JAVA_HOME
	unset JDK_HOME
	source "$(brew --prefix jenv)/libexec/completions/jenv.zsh"
	# source '/opt/homebrew/Cellar/jenv/0.5.6/libexec/libexec/../completions/jenv.zsh'
	jenv rehash 2>/dev/null 
	jenv refresh-plugins 2>/dev/null
	jenv() {
		type typeset &> /dev/null && typeset command
		command="$1"
		if [ "$#" -gt 0 ]; then
			shift
		fi

		case "$command" in
			enable-plugin|rehash|shell|shell-options)
				eval `jenv "sh-$command" "$@"`;;
			*)
				command jenv "$command" "$@";;
		esac
	}
fi
