# name: Default
# author: Lily Ballard

function fish_prompt --description 'Write out the prompt'
    echo -n -s (set_color "cyan") (prompt_pwd) (set_color "eb3467") " "$prompt_status "  " (set_color normal)
end
