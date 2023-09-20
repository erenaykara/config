[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

# When chaning the working directory, change the cwd of neovim
function set_nvim_pwd_after_change --on-variable PWD
    if set -q NVIM
        ~/.config/nvim/autocwd
    end
end

function font_name
    fc-list | grep $argv
end
