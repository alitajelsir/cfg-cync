# Configure	locale
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8

# Append PATH
export PATH=$PATH:$HOME/.local/bin

# Set XDG user directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Fix ownership
[[ $UID == 0 ]] ||
	(fd . -u --owner=root $HOME $PREFIIX -X \
	sudo chown -R $USERNAME:$USERNAME &)

# Remove tmp created by sudo
[[ $UID != 0 ]] ||
	trap "fd . -t d --owner=root $PREFIX/tmp -X rm -rf" EXIT

# Set apt configuration file
export APT_CONFIG=$XDG_CONFIG_HOME/apt/apt.conf
