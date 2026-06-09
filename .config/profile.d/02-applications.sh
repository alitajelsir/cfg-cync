export EDITOR=nvim
export FFMPEG_DATADIR=$XDG_CONFIG_HOME/ffmpeg
export GITDIR=$XDG_DATA_HOME/git
export GIT_CONFIG_GLOBAL=$XDG_CONFIG_HOME/git/config
export LESS="$LESS -x2RF"
export MANPATH=:$PREFIX/share/man:$XDG_DATA_HOME/man
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/rg/config

if [[ $UID != 0 ]]; then
	fd . -t l --max-depth=1 $HOME -X rm
	ln -sf /storage/emulated/0/* $HOME
fi
