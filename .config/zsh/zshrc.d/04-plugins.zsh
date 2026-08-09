# Install plugins
[[ -d $XDG_STATE_HOME/zsh ]] ||
	mkdir -p $XDG_STATE_HOME/zsh

local _plugins _static
local -a _snapshot
	_plugins=$ZDOTDIR/.zplugins
	_static=$XDG_STATE_HOME/zsh/zplugins.zsh
	_snapshot=(${(f)"$(antidote snapshot)":#No snapshots*})

if [[ ! $_static -nt $_plugins || ! $_static -nt "${_snapshot[1]:-$_plugins}" ]]; then
  antidote bundle <$_plugins >!$_static
fi
source $_static

local _zcolors="$(antidote path marlonrichert/zcolors)"
if [[ ! $XDG_STATE_HOME/zsh/zcolors.zsh -nt $_zcolors/zcolors ]]; then
	$_zcolors/zcolors >!$XDG_STATE_HOME/zsh/zcolors.zsh
fi
source $XDG_STATE_HOME/zsh/zcolors.zsh

# Configure plugins
# Set syntax highlighting theme
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance

# Set recent directories file
zstyle ':chpwd:*' recent-dirs-file $XDG_STATE_HOME/zsh/chpwd-recent-dirs
