local keys = {
    { "gw", ":HopWord<cr>",   desc = "Go to word" },
    { "gl", ":HopLine<cr>",   desc = "Go to line" },
}

return {
    'smoka7/hop.nvim',
    config = true,
    keys = keys,
}
