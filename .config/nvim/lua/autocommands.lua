-- Clear jump buffer on start
vim.cmd("autocmd VimEnter * :clearjumps")

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
        vim.api.nvim_buf_set_keymap(0, "t", "<esc>", "<C-\\><C-n>", {})
    end
})
