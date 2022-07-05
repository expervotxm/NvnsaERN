# Bash completion definition for you-get.

_you-get () {
    COMPREPLY=()
    local IFS=$' \n'
    local cur=$2 prev=$3
    local -a opts_without_arg opts_with_arg
    opts_without_arg=(
        -V --version -h --help -i --info -u --url --json -n --no-merge
        --no-caption -f --force --no-proxy -d --debug
        -F --format -O --output-filename -o --output-dir -p --player
        -c --cookies -x --http-proxy -y --extractor-proxy -t --timeout
    )

    [[ $cur == -* ]] || return 1

    # Do not complete when the previous arg is an option expecting an argument
    for opt in "${opts_with_arg[@]}"; do
        [[ $opt == $prev ]] && return 1
    done

    # Complete option names
    COMPREPLY=( $(compgen -W "${opts_without_arg[*]} ${opts_with_arg[*]}" \
    return 0
}

complete -F _you-get you-get
