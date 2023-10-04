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

local function commits_on_visual()
    require('telescope.builtin').git_bcommits_range()
end

local keys = {
    { "lf",  ":Telescope find_files<cr>",                                               silent = true },
    { "lF",  ":Telescope oldfiles<cr>",                                                 silent = true },
    { "lg",  ":Telescope live_grep<cr>",                                                silent = true },
    { "lG",  ":Telescope lsp_workspace_symbols<cr>",                                    silent = true },
    { "le",  ":Telescope current_buffer_fuzzy_find<cr>",                                silent = true },
    { "lw",  ":Telescope grep_string<cr>",                                              silent = true },
    { "ls",  ":Telescope buffers<cr>",                                                  silent = true },
    { "lr",  ":Telescope treesitter<cr>",                                               silent = true },
    { "lR",  ":Telescope lsp_document_symbols<cr>",                                     silent = true },
    { "lc",  ":Telescope commands<cr>",                                                 silent = true },
    { "lC",  ":Telescope command_history<cr>",                                          silent = true },
    { "lk",  ":Telescope keymaps<cr>",                                                  silent = true },
    { "lmb", ":Telescope git_branches<cr>",                                             silent = true },
    { "lmc", ":Telescope git_bcommits<cr>",                                             silent = true },
    { "lmc", mode = "v",                                                                commits_on_visual },
    { "lms", ":Telescope git_status<cr>",                                               silent = true },
    { "lmS", ":Telescope git_stash<cr>",                                                silent = true },
    { "lM",  ":lua require('telescope.builtin').man_pages({ sections={ 'ALL' } })<cr>", silent = true },
    { "lh",  ":lua require('telescope.builtin').help_tags()<cr>",                       silent = true },
    { "lt",  ":TodoTelescope<cr>",                                                      silent = true },
}

return {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = true,
    opts = opts,
    keys = keys,
    cmd = "Telescope",
}
