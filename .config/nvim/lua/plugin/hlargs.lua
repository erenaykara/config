return {
    'm-demare/hlargs.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    event = { "BufRead", "BufNewFile" },
}
