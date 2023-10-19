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
    -- Instantly close buffers after selecting a file
    cleanup_delay_ms = 0,
    keymaps = {
        -- Remap toggling of hidden files to "th"
        ["th"] = "actions.toggle_hidden",
        ["g."] = false,
        -- Remap opening file externally to "ge"
        ["ge"] = "actions.open_external",
        ["gx"] = false,
    }
}

local keys = {
    { "-", open, desc = "Open directory view"},
}

return {
    'stevearc/oil.nvim',
    config = true,
    opts = opts,
    keys = keys,
    -- Since oil hijacks the file explorer we can't lazy load it
    lazy = false,
}
