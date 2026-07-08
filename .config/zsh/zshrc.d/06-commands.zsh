# Configure aliases
() {

	# List aliases
	local -a _commands=(
		%= \$= ❯=
		-='cd -'
		aria2c="aria2c --dir $HOME/Downloads"
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cfg="git --git-dir $XDG_DATA_HOME/git/cfg-sync --work-tree $HOME"
		cpi='cp -iv'
		lsa='eza -abF --icons --group-directories-first'
		fh='fd -u'
		ffm='ffmpeg -hide_banner'
		ffp='ffprobe -hide_banner'
		mdl=yt-dlp
		mdla='yt-dlp -x -f ba/b'
		mvi='mv -iv'
		plg="cd $(mktemp -d)"
		rmi='rm -Iv'
		rsl='rsync -PW'
		sudo='sudo '
	)

	# Set aliases
	alias -- "${_commands[@]}"
}

# Set global aliases
alias -g '$= '
