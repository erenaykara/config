local keys = {
    {
        "mo",
        function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            local is_gitdir = gitdir and #gitdir > 0 and #gitdir < #filepath

            if is_gitdir then
                package.loaded.neogit.open()
            else
                print("not currently in a git directory")
            end
        end,
        desc = "Open neogit"
    },
}

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "sindrets/diffview.nvim",
    },
    config = true,
    keys = keys,
}
