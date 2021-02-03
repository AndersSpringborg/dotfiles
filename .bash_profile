#!/usr/bin/env bash



logDotfiles "Loading dotfiles";
# Load the shell dotfiles:
for file in ~/.{aliases,bash_prompt,exports,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

logDotfiles "Configuring bash profile";

OPTIONS=(
    "autocd"   # autocd, e.g. **/qux will enter ./foo/bar/baz/qux
    "globstar" # Recursive globbing, e.g. "echo **/*.txt"
    "cdspell"  # Autocorrect typos in path names when using "cd"
    "nocaseglob"  # Case-insensitive globbing (used in pathname expansion)
    "histappend"  # Append to the Bash history file, rather than overwriting it
)
for option in ${OPTIONS[@]}; do
    echo -e "--> $option \t\e[32mON\e[39m";
	shopt -s "$option" > /dev/null;
done;
unset $OPTIONS;


## FUCK support
eval "$(thefuck --alias)"

# Add tab completion for many Bash commands
if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;