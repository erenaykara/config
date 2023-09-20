local function open()
    if vim.fn.getwininfo(vim.fn.win_getid())[1].terminal == 1 then
        local working_directory = vim.fn.getcwd();
        package.loaded.oil.open(working_directory)
    else
        local buffer_path = vim.api.nvim_buf_get_name(0)
        local buffer_directory = vim.fn.fnamemodify(buffer_path, ":h")
        package.loaded.oil.open(buffer_directory)
    end
end

local opts = {
    -- Remap toggling of hidden files to "th"
    keymaps = {
        ["th"] = "actions.toggle_hidden",
        ["g."] = false,
    }
}

local keys = {
    { "-", open },
}

return {
    'stevearc/oil.nvim',
    config = true,
    keys = keys,
    opts = opts,
}
