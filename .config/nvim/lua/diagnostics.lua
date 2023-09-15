local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

-- Diagnostics symbols
sign({name = 'DiagnosticSignError', text = '⛌'})
sign({name = 'DiagnosticSignWarn', text = '⚠'})
sign({name = 'DiagnosticSignHint', text = '!'})
sign({name = 'DiagnosticSignInfo', text = ''})

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
