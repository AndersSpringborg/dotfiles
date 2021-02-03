options=(
    "autocd"   # * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
    "globstar" # * Recursive globbing, e.g. `echo **/*.txt`
    "cdspell"  # Autocorrect typos in path names when using `cd`
)
for option in options; do
	shopt -s "$option" 2> /dev/null;
done;
