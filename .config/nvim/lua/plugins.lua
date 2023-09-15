return require('packer').startup(function()
    -- Packer so that it can update itself
    use 'wbthomason/packer.nvim'

    -- Language server
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'timonv/vim-cargo'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/vim-vsnip'
    use 've5li/cmp-buffer'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- Devicons
    use 'kyazdani42/nvim-web-devicons'

    -- Libmodal
    use {
        've5li/nvim-libmodal',
        branch = 'handle-escaped-keys'
    }

    -- File viewer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Searching
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Navigating in file
    use {
        'phaazon/hop.nvim',
        branch = 'v2'
    }

    -- Tagbar
    use 'preservim/tagbar'

    -- TODOs
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Errors and warnings
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Theme
    use 'tanvirtin/monokai.nvim'

    -- Highlight arguments
    use {
        'm-demare/hlargs.nvim',
        requires = 'nvim-treesitter/nvim-treesitter'
    }

    -- Multicursor
    use {
        've5li/better-multi.nvim',
        requires = 'nvim-libmodal'
    }

    -- Speed up startup
    use 'lewis6991/impatient.nvim'

    -- Git integration
    use {
        'tanvirtin/vgit.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Markdown perview
    use 'ellisonleao/glow.nvim'

    -- Crates.io
    use {
        'saecki/crates.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
end)
