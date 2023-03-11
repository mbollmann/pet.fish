function __pet_preview --description "Takes a snippet formatted by `pet search` and turns it into a preview pane for fzf."
    # Description
    set_color blue --bold
    echo $argv | sed 's/^\[// ; s/\]: .*//'
    set_color normal
    echo ""
    # Code (syntax-highlighted for fish)
    echo $argv | sed 's/.*]: // ; s/#.*//' | fish_indent --ansi
    # Tags, if present
    if string match -e -q "#" "$argv"
        echo ""
        # to be able to set tags with background color, loop over them individually
        for tag in (echo $argv | sed 's/[^#]*#/#/' | string split " ")
            set_color magenta # -b white
            echo -n "$tag"
            set_color normal
            echo -n " "
        end
        echo ""
    end
end
