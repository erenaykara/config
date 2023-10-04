local function config()
    require('nvim-treesitter.configs').setup({
        textobjects = {
            select = {
                enable = true,
                -- textobjs
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["iP"] = "@parameter.inner",
                    ["aP"] = "@parameter.outer",
                    ["ic"] = "@comment.inner",
                    ["ac"] = "@comment.outer",
                },
                -- Selection modes for textobjects
                selection_modes = {
                    ['@parameter.outer'] = 'v',
                    ['@function.outer'] = 'V',
                },
                -- When folding with "zfaf" we don't want to include the empty
                include_surrounding_whitespace = function(data)
                    return data.selection_mode ~= "V" or data.query_string ~= "@function.outer"
                end,
            },
        },
    })
end

return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = 'nvim-treesitter/nvim-treesitter',
    config = config,
    event = { "BufRead", "BufNewFile" },
}
