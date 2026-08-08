# Use antidote to mange plugins
# Set manger local and remote location
() {
	local _manger_local _manger_remote
		_manger_local=$XDG_DATA_HOME/zsh/plugins/mattmc3/antidote
		_manger_remote=https://github.com/mattmc3/antidote.git

# Install antidote
	[[ -r $_manger_local/antidote.zsh ]] ||
		git clone --depth 1 $_manger_remote $_manger_local
	source $_manger_local/antidote.zsh
}

# Configure antidote
export ANTIDOTE_HOME=$XDG_DATA_HOME/zsh/plugins
zstyle ':antidote:bundle' file $ZDOTDIR/.zplugins
zstyle ':antidote:static' file $XDG_STATE_HOME/zsh/zplugins.zsh
zstyle ':antidote:bundle' path-style short
zstyle ':antidote:*' zcompile 'yes'
