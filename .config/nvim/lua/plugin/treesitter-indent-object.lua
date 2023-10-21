return {
    "kiyoon/treesitter-indent-object.nvim",
    keys = {
        {
            "ai",
            function() require('treesitter_indent_object.textobj').select_indent_outer(false, 'V') end,
            mode = { "x", "o" },
            desc = "outer indentation",
        },
        {
            "ii",
            function() require('treesitter_indent_object.textobj').select_indent_inner(false, 'V') end,
            mode = { "x", "o" },
            desc = "inner indentation",
        },
    },
}
