# Use znap to mange plugins

# Set znap options
# Disable znap asynchronous compilation
zstyle ':znap:*' auto-compile no

# Set znap local and remote sources
() {
	local _manger_local _manger_remote
		_manger_local=$XDG_DATA_HOME/zsh/plugins/zsh-snap
		_manger_remote=https://github.com/marlonrichert/zsh-snap.git

# Install znap
	[[ -r $_manger_local/znap.zsh ]] ||
		git clone --depth 1 $_manger_remote $_manger_local
	source $_manger_local/znap.zsh
}
