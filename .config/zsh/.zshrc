# Unless running interactively, don't do anything
[[ $options[interactive] == on ]] ||
	return

# Split .zshrc into multiple files in zshrc.d
() {
	local _zshrc=
	for _zshrc in $ZDOTDIR/zshrc.d/<->-*.zsh(n); do
		source $_zshrc
	done
}
