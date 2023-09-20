-- LSP
local function set_lsp_bindings(buffer_options)
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
local function set_rust_tools_bindings(rust_tools, buffer_options)
    -- Hover actions
    vim.keymap.set("n", "<C-a>", rust_tools.hover_actions.hover_actions, buffer_options)
    vim.keymap.set("n", "<C-s>", rust_tools.code_action_group.code_action_group, buffer_options)

    -- Goto
    vim.keymap.set('n', 'gp', ":RustParentModule<cr>", { silent = true })
    vim.keymap.set('n', 'ge', ":RustOpenExternalDocs<cr>", { silent = true })
end

local function config()
    -- Rust
    local rust_tools = require('rust-tools')
    rust_tools.setup({

        -- Disable border on popups
        hover_actions = {
            border = "none",
        },

        -- Print message when Rust Analyzer started
        tools = {
            on_initialized = function()
                print("rust-analyzer started")
            end
        },

        -- Language server
        server = {

            on_attach = function(client, buffer_number)
                -- Fix Treesitter highlighting breaking when rust-analyzer loads
                -- Maybe temporary
                client.server_capabilities.semanticTokensProvider = nil

                local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
                set_lsp_bindings(buffer_options)
                set_rust_tools_bindings(rust_tools, buffer_options)
            end,

            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        enable = true,
                        command = "clippy",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                        allFeatures = true,
                    },
                    procMacro = {
                        enable = true
                    },
                },
            },
        },

        -- Debugging
        dap = {
            adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
            },
        },
    })

    -- Bash
    require('lspconfig').bashls.setup({
        on_attach = function(_, buffer_number)
            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
        end,
    })

    -- Typescript
    require('lspconfig').tsserver.setup({
        on_attach = function(_, buffer_number)
            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
        end,
    })

    -- Lua
    require('lspconfig').lua_ls.setup {
        on_attach = function(_, buffer_number)
            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
        end,

        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = {
                        'vim',
                        'require',
                        'use',
                    },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

return {
    'neovim/nvim-lspconfig',
    dependencies = 'simrat39/rust-tools.nvim',
    config = config,
    event = "BufRead",
}
