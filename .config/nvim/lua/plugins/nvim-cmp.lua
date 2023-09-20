local cmp_sources = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-calc',
    'hrsh7th/vim-vsnip',
    've5li/cmp-buffer',
}

local function config()
    -- Completion options
    vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
    vim.opt.shortmess = vim.opt.shortmess + { c = true }

    -- Completion plugin setup
    local cmp = require('cmp')

    cmp.setup({
        -- Enable LSP snippets
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            -- Add tab support
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            })
        },
        sources = {
            { name = 'path' },                                       -- file paths
            { name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
            { name = 'nvim_lsp_signature_help' },                    -- display function signatures with current parameter emphasized
            {
                name = 'buffer',                                     -- source current buffer
                keyword_length = 2,
                option = {
                    cases = { "snake", "pascal", "macro", "camel" }
                }
            },
            { name = 'vsnip', keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
            { name = 'calc' },                      -- source for math calculation
            { name = "crates" },                    -- crates.io integration
        },
        window = {
            completion = cmp.config.window.bordered({ border = "none" }),
            documentation = cmp.config.window.bordered({ border = "none" }),
        },
        formatting = {
            fields = { 'menu', 'abbr', 'kind' },
            format = function(entry, item)
                local menu_icon = {
                    nvim_lsp = '🧠',
                    vsnip = '✂️',
                    buffer = '✒️',
                    path = '📂',
                    calc = '🧮',
                    crates = '📦',
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
    })
end

return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = cmp_sources,
    config = config
}
