# Use instant prompt
[[ ! -f $XDG_CACHE_HOME/p10k-instant-prompt-"${(%):-%n}".zsh ]] ||
	source $XDG_CACHE_HOME/p10k-instant-prompt-"${(%):-%n}".zsh

# Set prompt theme
[[ ! -f $ZDOTDIR/.p10k.zsh ]] ||
	source $ZDOTDIR/.p10k.zsh

# Set cursor shape to bar
(){
	_cursor_bar() { printf '\e[6 q' }
	precmd_functions+=(_cursor_bar)
}
