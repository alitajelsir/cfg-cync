# Bind Alt+v to key description
bindkey '^[v' describe-key-briefly

# Bind Alt+w to widget key association
bindkey '^[w' where-is

# Bind Ctrl+x a to alias expansion
bindkey '^Xa' _expand_alias

# Bind Alt+shift+s to prefix with sudo
() {
	bindkey "^[S" "$1"
	zle -N $1
	$1() {
	  [[ $BUFFER == [[:space:]]# ]] &&
	    zle .up-history

	  LBUFFER=" sudo $LBUFFER"
	}
} .sudo
