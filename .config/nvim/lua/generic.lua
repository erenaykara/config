-- Vim options
vim.opt.signcolumn = "yes"
vim.opt.guicursor = "n-v-c:block-Cursor"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
vim.opt.whichwrap = "<,>"
vim.opt.list = true
vim.opt.swapfile = false
vim.opt.scrolloff = 8
vim.opt.confirm = true

-- Only show cursor line in the focused window
local cursorline_group = vim.api.nvim_create_augroup("cursorline_group", { clear = true })

vim.api.nvim_create_autocmd("WinEnter",
    { group = cursorline_group, callback = function() vim.wo.cursorline = true end }
)

vim.api.nvim_create_autocmd("WinLeave",
    { group = cursorline_group, callback = function() vim.wo.cursorline = false end }
)

-- Disable line numbers and signs for terminal buffers
local terminal_group = vim.api.nvim_create_augroup("terminal_group", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
    group = terminal_group,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.signcolumn = "no"
    end
})
