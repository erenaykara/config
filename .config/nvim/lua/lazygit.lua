vim.keymap.set("t", "<esc>", function()
    local keys

    if vim.api.nvim_buf_get_name(0):sub(-3) == "git" then
        keys = '<esc>'
    else
        keys = '<C-\\><C-n>'
    end

    local sequence = vim.api.nvim_replace_termcodes(keys, true, false, true)
    vim.api.nvim_feedkeys(sequence, 'n', true)
end)

vim.keymap.set("n", "<C-g>", function()
    -- Currently in the git buffer
    if vim.api.nvim_buf_get_name(0):sub(-3) == "git" then
        local sequence = vim.api.nvim_replace_termcodes(":b#<cr>", true, false, true)
        vim.api.nvim_feedkeys(sequence, 'n', true)
        return
    end

    -- Check if a git buffer already exists
    for _, buffer in pairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buffer):sub(-3) == "git" then
            vim.api.nvim_set_current_buf(buffer)
            vim.api.nvim_command("startinsert")
            return
        end
    end

    -- Create new terminal instance
    local sequence = vim.api.nvim_replace_termcodes(":term<cr>:keepalt file git<cr>:set nobl<cr>ilazygit<cr>", true,
        false, true)
    vim.api.nvim_feedkeys(sequence, 'n', true)
end)

vim.keymap.set("t", "<C-g>", function()
    if vim.api.nvim_buf_get_name(0):sub(-3) == "git" then
        local sequence = vim.api.nvim_replace_termcodes("<C-\\><C-n>:b#<cr>", true, false, true)
        vim.api.nvim_feedkeys(sequence, 'n', true)
    end
end)
