local keys = {
    { "<C-e>", "<Esc>:MultiVisualMode<cr>",     mode = "v",   silent = true },
    { "<C-e>", "viwo<Esc>:MultiVisualMode<cr>", silent = true },
    { "U",     ":MultiNormalMode<cr>U",         silent = true },
    { "E",     ":MultiNormalMode<cr>E",         silent = true },
}

return {
    've5li/better-multi.nvim',
    dependencies = 'nvim-libmodal',
    config = true,
    keys = keys,
}
