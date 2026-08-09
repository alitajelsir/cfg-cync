# Configure aliases
# List aliases
local -a _commands=(
	"\$"="" "%"="" "❯"=""
	-="cd -"
	aria2c="aria2c --dir $HOME/Downloads"
	bh="col -bx | bat -pl help --theme='Monokai Extended'"
	cpi="cp -iv"
	lsa="eza -abF -x --icons --group-directories-first"
	fh="fd -u"
	ffm="ffmpeg -hide_banner"
	ffp="ffprobe -hide_banner"
	mdl=yt-dlp
	mdla="yt-dlp -x -f ba/b"
	mvi="mv -iv"
	rmi="rm -Iv"
	rsl="rsync -PW"
	sudo="sudo "
)

# Set aliases
alias -- "${_commands[@]}"

[[ $UID == 0 ]] ||
	alias cfg="git --git-dir=$GITDIR/cfg-sync/ --work-tree=$HOME"

# Set global aliases
alias -g "\$= "


# Set functions
if [[ $UID != 0 ]]; then
	cfgcln() {
		local -a _cfgargs=(--git-dir="$GITDIR/cfg-sync/" --work-tree="$HOME")

		git "${_cfgargs[@]}" fetch --depth=1
		git "${_cfgargs[@]}" reflog expire --expire-unreachable=now --all
		git "${_cfgargs[@]}" gc --prune=now --aggressive
	}
fi

plg() { cd "$(mktemp -d)" }
