local opts = {
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
                    ["<C-d>"] = function() require('telescope.actions').delete_buffer() end
                },
                n = {
                    ["<C-d>"] = function() require('telescope.actions').delete_buffer() end
                }
            }
        }
    }
}

local keys = {
    {
        "lf",
        ":Telescope find_files<cr>",
        silent = true,
        desc =
        "Find files"
    },
    {
        "lF",
        ":Telescope oldfiles<cr>",
        silent = true,
        desc =
        "Find recent files"
    },
    {
        "lg",
        ":Telescope live_grep<cr>",
        silent = true,
        desc =
        "Find text"
    },
    {
        "lG",
        ":Telescope lsp_workspace_symbols<cr>",
        silent = true,
        desc =
        "Find lsp symbols in workspace"
    },
    {
        "le",
        ":Telescope current_buffer_fuzzy_find<cr>",
        silent = true,
        desc =
        "Fuzzy find in current buffer"
    },
    {
        "lw",
        ":Telescope grep_string<cr>",
        silent = true,
        desc =
        "Find word under cursor"
    },
    {
        "ls",
        ":Telescope buffers<cr>",
        silent = true,
        desc =
        "Find buffers"
    },
    {
        "lr",
        ":Telescope treesitter<cr>",
        silent = true,
        desc =
        "Find symbols in buffer"
    },
    {
        "lR",
        ":Telescope lsp_document_symbols<cr>",
        silent = true,
        desc =
        "Find lsp symbols in buffer"
    },
    {
        "lc",
        ":Telescope commands<cr>",
        silent = true,
        desc =
        "Find command"
    },
    {
        "lC",
        ":Telescope command_history<cr>",
        silent = true,
        desc =
        "Find command from history"
    },
    {
        "lk",
        ":Telescope keymaps<cr>",
        silent = true,
        desc =
        "Find keymaps"
    },
    {
        "lmc",
        ":Telescope git_bcommits<cr>",
        silent = true,
        desc =
        "Find commits in buffer"
    },
    {
        "lmc",
        mode = "v",
        function() require('telescope.builtin').git_bcommits_range() end,
        desc =
        "Find commits in selection"
    },
    {
        "lM",
        ":lua require('telescope.builtin').man_pages({ sections={ 'ALL' } })<cr>",
        silent = true,
        desc =
        "Find manual pages"
    },
    {
        "lh",
        ":lua require('telescope.builtin').help_tags()<cr>",
        silent = true,
        desc =
        "Find help pages"
    },
    {
        "lt",
        ":TodoTelescope<cr>",
        silent = true,
        desc =
        "Find TODOs"
    },
}

return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    opts = opts,
    keys = keys,
    cmd = "Telescope",
}
