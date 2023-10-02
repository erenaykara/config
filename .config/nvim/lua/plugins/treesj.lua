local opts = {
    use_default_keymaps = false,
}

local keys = {
    { "rm", function() package.loaded.treesj.toggle() end },
    { "rs", function() package.loaded.treesj.split() end },
    { "rj", function() package.loaded.treesj.join() end },
}

return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = true,
    opts = opts,
    keys = keys,
}
