# Install plugins
[[ -d $XDG_STATE_HOME/zsh ]] ||
	mkdir -p $XDG_STATE_HOME/zsh

local _plugins _static
local -a _snapshot
	_plugins=$ZDOTDIR/.zplugins
	_static=$XDG_STATE_HOME/zsh/zplugins.zsh
	_snapshot=(${(f)"$(antidote snapshot)":#No snapshots*})

[[ $_static -nt $_plugins && $_static -nt "${_snapshot[1]:-$_plugins}" ]] ||
  antidote bundle <$_plugins >!$_static
source $_static

[[ $XDG_STATE_HOME/zsh/zcolors.zsh -nt "$(which zcolors)" ]] ||
	zcolors >!$XDG_STATE_HOME/zsh/zcolors.zsh
source $XDG_STATE_HOME/zsh/zcolors.zsh

# Configure plugins
# Set syntax highlighting theme
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance

# Set recent directories file
zstyle ':chpwd:*' recent-dirs-file $XDG_STATE_HOME/zsh/chpwd-recent-dirs
