# Install plugins
[[ -d $XDG_STATE_HOME/zsh ]] ||
	mkdir -p $XDG_STATE_HOME/zsh

if [[ ! $XDG_STATE_HOME/zsh/zplugins.zsh -nt $ZDOTDIR/.zplugins ]]; then
  antidote bundle <$ZDOTDIR/.zplugins >!$XDG_STATE_HOME/zsh/zplugins.zsh
fi

source $XDG_STATE_HOME/zsh/zplugins.zsh

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
