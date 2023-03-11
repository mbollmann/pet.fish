function __pet_search --description 'Search pet for a query and replace the command line with the result'
    # Entire command line is the query
    set -l query (commandline)

    # Setting fzf's arguments -- assumes that fzf is set as pet's selectcmd
    set fzf_arguments --ansi --prompt="Search Snippets> " \
        --query="$query" --preview='__pet_preview {}'
    if not set --query FZF_DEFAULT_OPTS
        # copied from fzf.fish's defaults
        set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
    end
    # We locally append $fzf_arguments to the default options because we can't
    # call fzf directly; pet does this for us
    set --local --export --append FZF_DEFAULT_OPTS (string escape -- $fzf_arguments)
    set --local --export SHELL (command --search fish)

    pet search --query "$query" $argv | read cmd

    if test $status -eq 0 ; and test -n "$cmd"
        commandline --replace -- $cmd
    end

    commandline --function repaint
end
