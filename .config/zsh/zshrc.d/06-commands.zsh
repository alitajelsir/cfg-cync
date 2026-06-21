# Configure aliases
() {

	# List aliases
	local -a _commands=(
		%= \$= ❯=
		-='cd -'
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cget=termux-clipboard-get
		cpi='cp -iv'
		cset=termux-clipboard-set
		lsa='eza -abF --group-directories-first --icons=auto'
		fh='fd -uL --exclude=.suroot'
		ffm='ffmpeg -hide_banner'
		ffp='ffprobe -hide_banner'
		mvi='mv -iv'
		open=termux-open
		plg="cd $(mktemp -d)"
		rmi='rm -Iv'
		rsl='rsync -PW'
		mdl=yt-dlp
		mdla='yt-dlp -x -f ba/b'
		mdls="yt-dlp --no-embed-metadata --no-embed-subs --no-embed-thumbnail \
			-S vcodec:h264,acodec:aac,res:720 --merge-output-format mp4 -f 'bv+ba/best'"
		sudo='sudo '
		sul='sudo -P --no-create-hist --no-create-rc --shell=zsh su'
	)

	# Set aliases
	alias -- $_commands
}

[[ $UID == 0 ]] ||
	alias cfg="git --git-dir $GITDIR/cfg-sync/ --work-tree $HOME"


# Configure functions
# Colorize manpages
man() {
	command man "$@" | col --no-backspaces --spaces |
	bat --plain --language=man --theme=Monokai\ Extended
}

# Upgrade all pip installed packages
pup() {
	local -a _outdated=($(pip list --user --outdated | sed '1,2d; s/ .*$//'))
	[[ -z $_outdated ]] ||
		pip install --user --upgrade $_outdated
}
