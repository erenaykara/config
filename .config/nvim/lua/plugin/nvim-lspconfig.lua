-- LSP
local function set_lsp_bindings(buffer_options)
    local function desc(description)
        buffer_options["desc"] = description
        return buffer_options
    end

    -- Goto
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, desc "Go to definition")
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, desc "Go to type definition")
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, desc "Go to implementation")
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, desc "Go to references")
    vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, desc "Show signature help")

    -- Refactoring
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, desc "Rename")
    vim.keymap.set('n', 'rf', vim.lsp.buf.format, desc "Run formatter")
end

-- Rust Tools
local function set_rust_tools_bindings(rust_tools, buffer_options)
    local function desc(description)
        buffer_options["desc"] = description
        return buffer_options
    end

    -- Goto
    vim.keymap.set('n', 'gp', ":RustParentModule<cr>", { silent = true, desc = "Go to parent module" })
    vim.keymap.set('n', 'gE', ":RustOpenExternalDocs<cr>", { silent = true, desc = "Open external docs" })
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

    local lspconfig = require("lspconfig")

    -- Nix
    lspconfig.nil_ls.setup({
        on_attach = function(_, buffer_number)
            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
        end,
    })

    -- Typescript
    lspconfig.tsserver.setup({
        on_attach = function(_, buffer_number)
            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
        end,
    })

    -- Kotlin
    lspconfig.kotlin_language_server.setup({
        on_attach = function(_, buffer_number)
            local buffer_options = { noremap = true, silent = true, buffer = buffer_number }
            set_lsp_bindings(buffer_options)
        end,
    })

    -- Lua
    lspconfig.lua_ls.setup {
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
    event = { "BufRead", "BufNewFile" },
}
