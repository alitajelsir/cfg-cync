# Use antidote to mange plugins
local _manger_local _manger_remote
	_manger_local=$XDG_DATA_HOME/zsh/plugins/mattmc3/antidote
	_manger_remote=https://github.com/mattmc3/antidote.git

if [[ ! -r $_manger_local/antidote.zsh ]]; then
	printf '# zsh cloning mattmc3/antidote...\n'
	git clone --quiet --depth 1 $_manger_remote $_manger_local
fi
source $_manger_local/antidote.zsh

# Configure antidote
export ANTIDOTE_HOME=$XDG_DATA_HOME/zsh/plugins
zstyle ':antidote:bundle' file $ZDOTDIR/.zplugins
zstyle ':antidote:static' file $XDG_STATE_HOME/zsh/zplugins.zsh
zstyle ':antidote:bundle' path-style short
zstyle ':antidote:bundle:*' shallow true
zstyle ':antidote:snapshot' max 3
