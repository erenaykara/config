-- Extra bindings
vim.keymap.set("n", "b", "i<cr><esc>")
vim.keymap.set("n", "B", "i<cr><esc>O<esc>")
vim.keymap.set("n", "j", '"_deP')
vim.keymap.set("n", "<C-q>", function() vim.api.nvim_command('let @/ = ""') end)
vim.keymap.set("v", "sh", '"ay:s/<C-r>a/')
vim.keymap.set("v", "sf", '"ay:%s/<C-r>a/')

-- Faster cursor movement
vim.keymap.set("n", "<S-Up>", '10k')
vim.keymap.set("n", "<S-Down>", '10j')

-- Switching windows
vim.keymap.set("n", "wq", "<C-w>q", { silent = true })
vim.keymap.set("n", "wi", "<C-w><C-l>", { silent = true })
vim.keymap.set("n", "wn", "<C-w><C-h>", { silent = true })
vim.keymap.set("n", "wu", "<C-w><C-k>", { silent = true })
vim.keymap.set("n", "we", "<C-w><C-j>", { silent = true })
vim.keymap.set("n", "<C-b>", ":b#<cr>", { silent = true })
vim.keymap.set("n", "<C-z>", ":bw<cr>", { silent = true })

-- Moving windows
vim.keymap.set("n", "wI", "<C-w>L", { silent = true })
vim.keymap.set("n", "wN", "<C-w>H", { silent = true })
vim.keymap.set("n", "wU", "<C-w>K", { silent = true })
vim.keymap.set("n", "wE", "<C-w>J", { silent = true })
vim.keymap.set("n", "wt", "<C-w>T", { silent = true })

-- Terminal
vim.keymap.set("n", "<C-t>", ":term<cr>:keepalt file ")
vim.keymap.set("t", "<S-esc>", "<C-\\><C-n>")

function is_keymap_present(keymaps, keys)
    for _, keymap in ipairs(keymaps) do
        if keymap.lhs == keys then
            return true
        end
    end

    return false
end

vim.keymap.set("n", "re", function()
    local keymaps = vim.api.nvim_buf_get_keymap(0, "t")

    if is_keymap_present(keymaps, "<Esc>") then
        vim.api.nvim_buf_del_keymap(0, "t", "<Esc>")
    else
        vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", {})
    end
end)
