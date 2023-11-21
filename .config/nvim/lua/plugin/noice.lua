local opts = {
    cmdline = {
        view = "cmdline_popup",
        format = {
            cmdline = { icon = ":" },
            search_up = { icon = "?" },
            search_down = { icon = "/" },
        }
    },
    messages = {
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
    },
    views = {
        mini = {
            timeout = 8000,
        },
        popup = {
            border = {
                style = "none",
            },
        },
        cmdline_popup = {
            border = {
                style = "none",
            },
        },
        confirm = {
            border = {
                style = "none",
            },
        },
    },
}

return {
    "folke/noice.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', "MunifTanjim/nui.nvim" },
    opts = opts,
    event = "VeryLazy",
}
