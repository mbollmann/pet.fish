function __pet_new --description 'Saves a command as a snippet in pet'
    # Use the current contents of the command line
    set -l cmd (commandline | string split0)

    # If the command line is empty, let's search history
    if test -z (commandline)
        # Copying parts of fzf.fish's _fzf_search_history here, since we can't
        # directly re-use it
        if test -z "$fish_private_mode"
            builtin history merge
        end

        # Copied from fzf.fish's _fzf_wrapper, so we don't need to pull in
        # fzf.fish as a dependency just for this
        if not set --query FZF_DEFAULT_OPTS
            set --export FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"'
        end
        set --local --export SHELL (command --search fish)

        set cmd (builtin history --null --show-time="%m-%d %H:%M:%S │ " | \
            fzf --read0 \
            --print0 \
            --ansi \
            --tiebreak=index \
            --prompt="Save as Snippet> " \
            --query=(commandline) \
            --preview="echo -- {4..} | fish_indent --ansi" \
            --preview-window="bottom:3:wrap" \
            $fzf_history_opts | \
            # remove timestamps from commands selected
            string replace --regex '^\d\d-\d\d \d\d:\d\d:\d\d │ ' '')
    end

    if test -n "$cmd"
        echo "* Save a new pet snippet:"
        pet new --tag -- "$cmd"
    else
        commandline --function repaint
    end
end
