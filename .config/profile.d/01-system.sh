# Configure	locale
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8

# Append PATH
export PATH=/data/adb/ap/bin:/data/adb/ksu/bin:$PATH:$HOME/.local/bin

# Set XDG user directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Fix ownership
[[ $UID == 0 ]] ||
	(fd . -u --owner=root $HOME $PREFIX -X \
	sudo chown -R $USERNAME:$USERNAME &)

#
# Set apt configuration file
export APT_CONFIG=$XDG_CONFIG_HOME/apt/apt.conf
