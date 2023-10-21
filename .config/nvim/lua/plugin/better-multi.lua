local keys = {
    {
        "<C-e>",
        "<Esc>:MultiVisualMode<cr>",
        mode = "v",
        silent = true,
        desc =
        "Enter visual multi mode"
    },
    { "<C-e>", "viwo<Esc>:MultiVisualMode<cr>", silent = true, desc = "Enter visual multi mode" },
    { "U",     ":MultiNormalMode<cr>U",         silent = true, desc = "Add cursor down" },
    { "E",     ":MultiNormalMode<cr>E",         silent = true, desc = "Add cursor up" },
}

return {
    've5li/better-multi.nvim',
    dependencies = 'nvim-libmodal',
    config = true,
    keys = keys,
}
