# Configure options
# List options
local -a _options=(
	# Changing Directories
	auto_cd

	# Expansion and Globbing
	extended_glob
	glob
	glob_dots
	glob_star_short
	numeric_glob_sort

	# History
	hist_fcntl_lock
	hist_ignore_all_dups
	hist_ignore_space
	hist_no_functions
	hist_no_store
	hist_reduce_blanks
	hist_verify
	share_history

	# Input and Output
	correct
	interactive_comments
	no_flow_control
	no_clobber

	# Shell Emulation
	append_create
)

# Set options
setopt "${_options[@]}"

# Configure history file
HISTFILE="$ZDOTDIR/.zhistory"
SAVEHIST=$(( 10 * 1000 ))
HISTSIZE=$(( 1.2 * SAVEHIST ))
HISTORY_IGNORE="(-|.|/|~|cd |run-help)*"

# Accept exact directory matches
zstyle ':completion:*' accept-exact-dirs true

# Sort grid completion by rows
zstyle ':completion:*' list-rows-first true

# Keep prefix in expansion
zstyle ':completion:*:expand:*' keep-prefix true

# Prioritize local files in rsync completion
zstyle ':completion:*:rsync:*' tag-order files

# Access on-line help
unalias run-help
autoload -Uz run-help

# Create named directories
hash -d bak=/sdcard/Android/bak git="$GITDIR" zsh="$ZDOTDIR"

# Set functions path
fpath=("$PREFIX/share/zsh/site-functions" $fpath)

# Use emacs mode
bindkey -e
