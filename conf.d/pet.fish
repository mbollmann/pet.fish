if not status is-interactive && test "$CI" != true
    exit
end

bind --preset \cs __pet_search
bind --preset \e\cn __pet_new

function _pet_uninstall --on-event pet_uninstall
    functions --erase __pet_new __pet_search __pet_preview
end
