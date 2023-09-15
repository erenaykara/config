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
vim.keymap.set("t", "<esc>", function()
    local keys

    if vim.api.nvim_buf_get_name(0):sub(-3) == "git" then
        keys = '<esc>'
    else
        keys = '<C-\\><C-n>'
    end

    local sequence = vim.api.nvim_replace_termcodes(keys, true, false, true)
    vim.api.nvim_feedkeys(sequence, 'n', true)
end)

vim.keymap.set("n", "<C-g>", function()
    -- Currently in the git buffer
    if vim.api.nvim_buf_get_name(0):sub(-3) == "git" then
        local sequence = vim.api.nvim_replace_termcodes(":b#<cr>", true, false, true)
        vim.api.nvim_feedkeys(sequence, 'n', true)
        return
    end

    -- Check if a git buffer already exists
    for _, buffer in pairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buffer):sub(-3) == "git" then
            vim.api.nvim_set_current_buf(buffer)
            vim.api.nvim_command("startinsert")
            return
        end
    end

    -- Create new terminal instance
    local sequence = vim.api.nvim_replace_termcodes(":term<cr>:keepalt file git<cr>:set nobl<cr>ilazygit<cr>", true,
        false, true)
    vim.api.nvim_feedkeys(sequence, 'n', true)

    --buffer = vim.api.nvim_create_buf(false, true)
    --vim.api.nvim_open_term(buffer, )
    --vim.api.nvim_buf_set_name(buffer, "git")
    --vim.api.nvim_command("startinsert")
    --// start command lazygit

    -- remap <esc> just for this buffer
end)

vim.keymap.set("t", "<C-g>", function()
    if vim.api.nvim_buf_get_name(0):sub(-3) == "git" then
        local sequence = vim.api.nvim_replace_termcodes("<C-\\><C-n>:b#<cr>", true, false, true)
        vim.api.nvim_feedkeys(sequence, 'n', true)
    end
end)

-- Telescope
vim.keymap.set("n", "lf", ":Telescope find_files<cr>", { silent = true })
vim.keymap.set("n", "lg", ":Telescope live_grep<cr>", { silent = true })
vim.keymap.set("n", "ls", ":Telescope buffers<cr>", { silent = true })
vim.keymap.set("n", "lr", ":Telescope treesitter<cr>", { silent = true })
vim.keymap.set("n", "lm", ":Telescope git_branches<cr>", { silent = true })
vim.keymap.set("n", "lM", ":lua require('telescope.builtin').man_pages({ sections={ 'ALL' } })<cr>", { silent = true })
vim.keymap.set("n", "lh", ":lua require('telescope.builtin').help_tags()<cr>", { silent = true })
vim.keymap.set("n", "lt", ":TodoTelescope<cr>", { silent = true })

-- Nvim Tree
vim.keymap.set("n", "<C-p>", ":NvimTreeToggle<cr>", { silent = true })

-- Tagbar
vim.g.tagbar_map_nexttag = "" -- Unbind so that switching windows works
vim.keymap.set("n", "lb", ":TagbarToggle<cr>", { silent = true })

-- Trouble
vim.keymap.set("n", "lp", ":TroubleToggle<cr>", { silent = true })

-- Diagnostics
vim.keymap.set("n", "<C-d>", function() vim.diagnostic.open_float(nil, { focusable = false }) end)

-- Better multi
vim.keymap.set("v", "<C-e>", "<Esc>:MultiVisualMode<cr>", { silent = true });
vim.keymap.set("n", "<C-e>", "viwo<Esc>:MultiVisualMode<cr>", { silent = true });
vim.keymap.set("n", "U", ":MultiNormalMode<cr>U", { silent = true });
vim.keymap.set("n", "E", ":MultiNormalMode<cr>E", { silent = true });

-- Git
vim.keymap.set("n", "mu", ":VGit hunk_up<cr>", { silent = true })
vim.keymap.set("n", "me", ":VGit hunk_down<cr>", { silent = true })
vim.keymap.set("n", "mc", ":VGit checkout")
vim.keymap.set("n", "md", ":VGit buffer_diff_preview<cr>", { silent = true })
vim.keymap.set("n", "mD", ":VGit buffer_diff_staged_preview<cr>", { silent = true })
vim.keymap.set("n", "mh", ":VGit buffer_history_preview<cr>", { silent = true })
vim.keymap.set("n", "mb", ":VGit buffer_blame_preview<cr>", { silent = true })
vim.keymap.set("n", "ms", ":VGit buffer_hunk_stage<cr>", { silent = true })
vim.keymap.set("n", "mS", ":VGit buffer_stage<cr>", { silent = true })
vim.keymap.set("n", "mU", ":VGit buffer_unstage<cr>", { silent = true })
vim.keymap.set("n", "mr", ":VGit buffer_hunk_reset<cr>", { silent = true })
vim.keymap.set("n", "mR", ":VGit buffer_reset<cr>", { silent = true })
vim.keymap.set("n", "mP", ":VGit project_diff_preview<cr>", { silent = true })

-- LSP
function set_lsp_bindings(buffer_options)
    -- Goto
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buffer_options)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, buffer_options)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buffer_options)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, buffer_options)
    vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, buffer_options)

    -- Refactoring
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, buffer_options)
    vim.keymap.set('n', 'rf', vim.lsp.buf.format, buffer_options)
end

-- Rust Tools
function set_rust_tools_bindings(rust_tools, buffer_options)
    -- Hover actions
    vim.keymap.set("n", "<C-a>", rust_tools.hover_actions.hover_actions, buffer_options)
    vim.keymap.set("n", "<C-s>", rust_tools.code_action_group.code_action_group, buffer_options)

    -- Goto
    vim.keymap.set('n', 'gp', ":RustParentModule<cr>", { silent = true })
    vim.keymap.set('n', 'ge', ":RustOpenExternalDocs<cr>", { silent = true })
end
