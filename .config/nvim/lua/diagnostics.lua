local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

-- Diagnostics symbols
sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })
sign({ name = 'DiagnosticSignHint', text = '󰍉' })

-- Diagnostics configuration
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'none',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.keymap.set("n", "<C-d>", function() vim.diagnostic.open_float(nil, { focusable = false }) end,
    { desc = "Open diagnostics" })
