-- Plugins
require("plugins")

-- Color theme
require('monokai').setup()

-- Key bindings
require("bindings")

-- Status line
require("statusline")

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Rust tools
local rust_tools = require('rust-tools')
rust_tools.setup({

    -- Disable border on popups
    hover_actions = {
        border = "none",
    },

    tools = {
        on_initialized = function()
            print("rust-analyzer started")
        end
    },

    -- Language server
    server = {

        on_attach = function(client, buffer_number)
            -- Fix Treesitter highlighting breaking when rust-analyzer loads
            -- Maybe temporary
            client.server_capabilities.semanticTokensProvider = nil

            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
            set_rust_tools_bindings(rust_tools, buffer_options)
        end,

        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                    allFeatures = true,
                },
                procMacro = {
                    enable = true
                },
            },
        },
    },

    -- Debugging
    dap = {
        adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
        },
    },
})

-- Bash language server
require('lspconfig').bashls.setup({
    on_attach = function(_, buffer_number)
        local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
        set_lsp_bindings(buffer_options)
    end,
})

-- Typescript language server
require('lspconfig').tsserver.setup({
    on_attach = function(_, buffer_number)
        local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
        set_lsp_bindings(buffer_options)
    end,
})

-- Lua language server
require('lspconfig').sumneko_lua.setup({
    on_attach = function(_, buffer_number)
        local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
        set_lsp_bindings(buffer_options)
    end,
})

-- LSP Diagnostics Options Setup
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

-- Completion options
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}

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
    -- Installed sources:
    sources = {
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2 },      -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer',                              -- source current buffer
            keyword_length = 2,
            option = {
                cases = { "snake", "pascal" }
            }
        },
        { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
        { name = 'calc'},                               -- source for math calculation
        { name = "crates" },                            -- crates.io integration
    },
    window = {
        completion = cmp.config.window.bordered({ border = "none" }),
        documentation = cmp.config.window.bordered({ border = "none" }),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- Treesitter config
local treesitter_config = {
    ensure_installed = { "lua", "rust", "toml" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

-- Nvim Tree config
local tree_congig = {
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    view = {
        side = "right"
    },
    renderer = {
        icons = {
            glyphs = {
                git = {
                    unstaged = "⚠",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "",
                    ignored = "◌",
                }
            }
        }
    }
}

-- Telescope config
local telescope_config = {
    defaults = {
        border = false,
        layout_strategy = 'bottom_pane',
        layout_config = {
            height = 0.9,
            bottom_pane = {
                prompt_position = "bottom"
            },
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<C-d>"] = require('telescope.actions').delete_buffer
                },
                n = {
                    ["<C-d>"] = require('telescope.actions').delete_buffer
                }
            }
        }
    }
}

-- Other
require('nvim-treesitter.configs').setup(treesitter_config)
require("nvim-tree").setup(tree_congig)
require('telescope').setup(telescope_config)
require('hop').setup()
require('todo-comments').setup()
require('trouble').setup()
require('impatient')
require('glow').setup()
require('hlargs').setup()
require('crates').setup()
require('vgit').setup()

-- Vim settings
vim.opt.signcolumn = "yes"
vim.opt.guicursor = "n-v-c:block-Cursor"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "<,>"
vim.opt.list = true
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.confirm = true

-- Custom command
vim.api.nvim_create_user_command("D", "bd", { desc = "remapped :bd for deleting buffers" })

-- Only show cursor line in the focused window
local cursorline_group = vim.api.nvim_create_augroup("cursorline_group", { clear = true })

vim.api.nvim_create_autocmd("WinEnter",
    { group = cursorline_group, callback = function() vim.wo.cursorline = true end }
)

vim.api.nvim_create_autocmd("WinLeave",
    { group = cursorline_group, callback = function() vim.wo.cursorline = false end }
)

-- Disable line numbers and signs for terminal buffers
local terminal_group = vim.api.nvim_create_augroup("terminal_group", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
    group = terminal_group,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.signcolumn = "no"
    end
})
