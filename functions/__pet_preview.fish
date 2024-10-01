function __pet_preview --description "Takes a snippet formatted by `pet search` and turns it into a preview pane for fzf."
    set -l tags (echo (echo $argv | sed 's/\\\\n/\n/g')[-1] | sed 's/[^#]*#/#/')
    # Description
    set_color blue --bold
    echo $argv | sed 's/^\[// ; s/\]: .*//'
    set_color normal
    echo ""
    # Code (syntax-highlighted for fish)
    echo $argv | \
        sed 's/\\\\n/\n/g' |  # replace pet newlines with normal ones
        sed '0,/\[[^]]*\]:/s///' | # delete bracketed description
        sed "s/$tags//g" | # find and delete tags 
        sed 's/<\([^ =]\+\)\([^ ]*\)>/{$\U\1}/g' | # replace pet placeholders with variable names
        fish_indent --ansi
    # Tags, if present  
    if string match -e -q "#" "$argv"
        echo ""
        # to be able to set tags with background color, loop over them individually
        for tag in $tags
            set_color magenta # -b white
            echo -n "$tag"
            set_color normal
            echo -n " "
        end
        echo ""
    end
end
