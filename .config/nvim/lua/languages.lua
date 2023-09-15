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
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
