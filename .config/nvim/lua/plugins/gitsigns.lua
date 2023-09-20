local function set_bindings(buffer_options)
    local gitsings = package.loaded.gitsigns

    -- Staging
    vim.keymap.set('n', 'ms', gitsings.stage_hunk)
    vim.keymap.set('n', 'mu', gitsings.undo_stage_hunk)
    vim.keymap.set('n', 'mr', gitsings.reset_hunk)
    vim.keymap.set('v', 'ms', function() gitsings.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    vim.keymap.set('v', 'mr', function() gitsings.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    vim.keymap.set('n', 'mS', gitsings.stage_buffer)
    vim.keymap.set('n', 'mU', gitsings.reset_buffer_index)
    vim.keymap.set('n', 'mR', gitsings.reset_buffer)

    -- Tools
    vim.keymap.set("n", "md", function() gitsings.diffthis("~") end)
    vim.keymap.set("n", "mD", gitsings.toggle_deleted)
    vim.keymap.set('n', 'mb', gitsings.blame_line)
end

local opts = {
    on_attach = function(buffer_number)
        set_bindings({ buffer = buffer_number })
    end,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text_pos = "right_align",
    },
    preview_config = {
        border = "none",
        row = 1,
    },
    yadm = {
        enable = true,
    }
}

return {
    'lewis6991/gitsigns.nvim',
    config = true,
    opts = opts,
    event = "BufRead",
}
