# Configure	locale
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8

# Append PATH
export PATH="$PATH:/data/adb/ap/bin:/data/adb/ksu/bin:$HOME/.local/bin"

# Set XDG user directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Set apt configuration file
export APT_CONFIG=$XDG_CONFIG_HOME/apt/apt.conf

# Fix ownership
[[ $UID == 0 ]] || 
	(find "$HOME" "$PREFIX" -user root \
		-exec sudo chown "$USERNAME:$USERNAME" {} + &>/dev/null &)
