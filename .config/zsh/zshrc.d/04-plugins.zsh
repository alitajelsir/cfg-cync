# Install plugins
() {

	# List plugins
	local -a _plugins=(
		zdharma-continuum/fast-syntax-highlighting
		marlonrichert/zcolors
		zsh-users/zsh-autosuggestions
		zsh-users/zsh-completions
		marlonrichert/zsh-autocomplete
		marlonrichert/zsh-edit
	)

	# Clone plugins in parallel
	znap clone $_plugins

	# Source plugins one by one
	local _plugin=
	for _plugin in "${_plugins[@]}"; do
		znap source $_plugin
	done
}


# Configure plugins
# Set syntax highlighting theme
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance

# Cache zcolor output
znap eval zcolors zcolors

# Define completion group order
zstyle ':completion:*' group-order \
	options aliases suffix-aliases functions reserved-words builtins commands \
	remotes hosts recent-branches commits \
	named-directories local-directories directories \
	executable expansions all-expansions

# Keep prefix in expansion
zstyle ':completion:*:expand:*' keep-prefix true

# Prioritize local files in rsync completion
zstyle ':completion:*:rsync:*' tag-order files

# Set recent directories file
zstyle ':chpwd:*' recent-dirs-file $XDG_CACHE_HOME/zsh/chpwd-recent-dirs
