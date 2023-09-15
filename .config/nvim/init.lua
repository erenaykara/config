-- Function for inspecting tables
P = function(value)
    print(vim.inspect(value))
    return value
end

-- Plugins
require("plugins")

-- Color theme
require('monokai').setup({ palette = require('monokai').soda })

-- Key bindings
require("bindings")

-- Custom status line
require("statusline")

-- Mason
require("mason").setup()
require("mason-lspconfig").setup()

-- Language servers
require("languages")

-- Diagnostics visualization
require("diagnostics")

-- Word completion configuration
require("completion")

-- Treesitter config
local treesitter_config = {
    ensure_installed = { "lua", "rust", "toml" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

-- Nvim Tree config
local tree_config = {
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

-- Plugins
require('nvim-treesitter.configs').setup(treesitter_config)
require("nvim-tree").setup(tree_config)
require('telescope').setup(telescope_config)
require('hop').setup()
require('todo-comments').setup()
require('trouble').setup()
require('impatient')
require('glow').setup()
require('hlargs').setup()
require('crates').setup()
require('vgit').setup()
require('better-multi').setup()

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
