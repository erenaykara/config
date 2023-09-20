-- Extra bindings
vim.keymap.set("n", "b", "i<cr><esc>")
vim.keymap.set("n", "B", "i<cr><esc>O<esc>")
vim.keymap.set("n", "j", '"_deP')
vim.keymap.set("n", "<C-q>", function() vim.api.nvim_command('let @/ = ""') end)
vim.keymap.set("v", "s", '"ay:s/<C-r>a/')
vim.keymap.set("v", "S", '"ay:%s/<C-r>a/')

-- Faster cursor movement
vim.keymap.set("n", "<S-Up>", '10k')
vim.keymap.set("n", "<S-Down>", '10j')

-- Switching windows
vim.keymap.set("n", "wi", "<C-w><C-l>", { silent = true })
vim.keymap.set("n", "wn", "<C-w><C-h>", { silent = true })
vim.keymap.set("n", "wu", "<C-w><C-k>", { silent = true })
vim.keymap.set("n", "we", "<C-w><C-j>", { silent = true })
vim.keymap.set("n", "<C-b>", ":b#<cr>", { silent = true })
vim.keymap.set("n", "<C-z>", ":bw<cr>", { silent = true })

-- Terminal
vim.keymap.set("n", "<C-t>", ":term<cr>:keepalt file ")
vim.keymap.set("t", "<S-esc>", "<C-\\><C-n>")
