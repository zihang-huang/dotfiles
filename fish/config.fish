if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

function fish_greeting
    set_color cyan -o; fortune -s; set_color normal;
    
end

thefuck --alias | source

set PATH /var/lib/snapd/snap/bin $PATH
set XDG_DATA_DIRS /var/lib/snapd/desktop/:$XDG_DATA_DIRS
