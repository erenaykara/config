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
    { "lf", ":Telescope find_files<cr>",                                               silent = true },
    { "lg", ":Telescope live_grep<cr>",                                                silent = true },
    { "ls", ":Telescope buffers<cr>",                                                  silent = true },
    { "lr", ":Telescope treesitter<cr>",                                               silent = true },
    { "lm", ":Telescope git_branches<cr>",                                             silent = true },
    { "lM", ":lua require('telescope.builtin').man_pages({ sections={ 'ALL' } })<cr>", silent = true },
    { "lh", ":lua require('telescope.builtin').help_tags()<cr>",                       silent = true },
    { "lt", ":TodoTelescope<cr>",                                                      silent = true },
}

return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    opts = opts,
    keys = keys,
    cmd = "Telescope",
}
