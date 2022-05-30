#!/usr/bin/env bash

# Load the shell dotfiles:
for file in ~/.{aliases,exports,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enabeling bash options.
# https://www.computerhope.com/unix/bash/shopt.htm
OPTIONS=(
    "autocd"   # autocd, e.g. **/qux will enter ./foo/bar/baz/qux
    "globstar" # Recursive globbing, e.g. "echo **/*.txt"
    "cdspell"  # Autocorrect typos in path names when using "cd"
    "nocaseglob"  # Case-insensitive globbing (used in pathname expansion)
    "histappend"  # Append to the Bash history file, rather than overwriting it
)
for option in ${OPTIONS[@]}; do
	shopt -s "$option" > /dev/null;
done;
unset $OPTIONS;


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

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# dotnet
#no data pls
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export EDITOR='vim'
export VISUAL='vim'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# starship
            __starship() {
                local major="${BASH_VERSINFO[0]}"
                local minor="${BASH_VERSINFO[1]}"

                if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
                    source <(/usr/local/bin/starship init bash --print-full-init)
                else
                    source /dev/stdin <<<"$(/usr/local/bin/starship init bash --print-full-init)"
                fi
            }
            __starship
            unset -f __starship
# end starship

