export EDITOR=nvim
export FFMPEG_DATADIR="$XDG_CONFIG_HOME/ffmpeg"
export GIT_CONFIG_GLOBAL="$XDG_CONFIG_HOME/git/config"
export LESS="$LESS -x2RF"
export MANPATH="$MANPATH:$PREFIX/share/man:$XDG_DATA_HOME/man"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/rg/config"

if [[ "$(id -u)" != 0 ]]; then
	find "$HOME" -maxdepth 1 -type l -exec rm {} +
	ln -sf /storage/emulated/0/* "$HOME"
fi
