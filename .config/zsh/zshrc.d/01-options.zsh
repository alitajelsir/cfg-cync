# Configure options
() {

	# List options
	local -a _options=(
		# Changing Directories
		AUTO_CD

		# Completion
		GLOB_COMPLETE

		# Expansion and Globbing
		EXTENDED_GLOB
		GLOB
		GLOB_DOTS
		GLOB_STAR_SHORT
		NUMERIC_GLOB_SORT

		# History
		HIST_FCNTL_LOCK
		HIST_IGNORE_ALL_DUPS
		HIST_IGNORE_SPACE
		HIST_NO_FUNCTIONS
		HIST_NO_STORE
		HIST_REDUCE_BLANKS
		HIST_VERIFY
		SHARE_HISTORY

		# Input and Output
		CORRECT
		INTERACTIVE_COMMENTS
		NO_FLOW_CONTROL
		NO_CLOBBER

		# Shell Emulation
		APPEND_CREATE
	)

	# Set options
	setopt $_options
}


# Configure history file
HISTFILE=$ZDOTDIR/.zhistory
SAVEHIST=$(( 10 * 1000 ))
HISTSIZE=$(( 1.2 * SAVEHIST ))
HISTORY_IGNORE='(-|.|/|~|cd|run-help)*'

# Access on-line help
unalias run-help
autoload -Uz run-help

# Create named directories
hash -d zsh=$ZDOTDIR git=$GITDIR

# Set functions path
fpath=($PREFIX/share/zsh/site-functions $fpath)

# Use emacs mode
bindkey -e
