local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
    -- Move the lock file to the cache directory
    lockfile = "~/.cache/nvim/lazy-lock.json",
    -- Don't notify the user about changes of plugins
    change_detection = {
        notify = false,
    },
    ui = {
        icons = {
            cmd = "🍀",
            config = "🧰",
            event = "📅",
            ft = "📂",
            init = "📦",
            keys = "🔑",
            plugin = "🔌",
            runtime = "💻",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤",
        },
    },
}

require("lazy").setup("plugins", opts)
