local opts = {
    popup = {
        border = "none",
    },
    mappings = {
        code_action = "<C-s>",
    }
}

return {
    "luckasRanarison/clear-action.nvim",
    opts = opts,
    event = { "BufRead", "BufNewFile" },
}
