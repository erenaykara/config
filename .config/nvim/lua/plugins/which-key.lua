local function init()
    vim.o.timeout = true
    vim.o.timeoutlen = 2000
end

return {
    "folke/which-key.nvim",
    init = init,
    event = "VeryLazy",
}
