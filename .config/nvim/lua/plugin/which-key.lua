local function init()
    vim.o.timeout = true
    vim.o.timeoutlen = 2000
end

local opts = {
    icons = {
        group = "",
    }
}

return {
    "folke/which-key.nvim",
    init = init,
    event = "VeryLazy",
    opts = opts,
}
