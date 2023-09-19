local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
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

local plugins = {
    -- Language server
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

    -- Rust
    'simrat39/rust-tools.nvim',
    'timonv/vim-cargo',

    -- Completion framework:
    'hrsh7th/nvim-cmp',

    -- LSP completion source:
    'hrsh7th/cmp-nvim-lsp',

    -- Useful completion sources:
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/cmp-path',
    'hrsh7th/vim-vsnip',
    've5li/cmp-buffer',

    -- Treesitter
    'nvim-treesitter/nvim-treesitter',

    -- Debugging
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',

    -- Devicons
    'kyazdani42/nvim-web-devicons',

    -- Libmodal
    {
        've5li/nvim-libmodal',
        branch = 'handle-escaped-keys'
    },

    -- File viewer
    'stevearc/oil.nvim',

    -- Searching
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.0',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    -- Tagbar
    'preservim/tagbar',

    -- TODOs
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    -- Errors and warnings
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },

    -- Theme
    'tanvirtin/monokai.nvim',

    -- Highlight arguments
    {
        'm-demare/hlargs.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter'
    },

    -- Multicursor
    {
        've5li/better-multi.nvim',
        dependencies = 'nvim-libmodal'
    },

    -- Speed up startup
    'lewis6991/impatient.nvim',

    -- Git signs
    'lewis6991/gitsigns.nvim',

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },

    -- Markdown perview
    'ellisonleao/glow.nvim',

    -- Crates.io
    {
        'saecki/crates.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },
}

require("lazy").setup(plugins, {})
