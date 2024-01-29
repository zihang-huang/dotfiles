if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

function fish_greeting
    set_color cyan -o; fortune -s; set_color normal;
    
end

thefuck --alias | source

export LANG=en_US.UTF-8

export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

set -gx PATH "$HOME/.cargo/bin" $PATH;

fish_vi_key_bindings

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/huangzihang/miniconda3/bin/conda
    eval /Users/huangzihang/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/Users/huangzihang/miniconda3/etc/fish/conf.d/conda.fish"
        . "/Users/huangzihang/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/Users/huangzihang/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

