if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

function fish_greeting
    set_color cyan -o; fortune -s; set_color normal;
    
end

thefuck --alias | source

export LANG=en_US.UTF-8
