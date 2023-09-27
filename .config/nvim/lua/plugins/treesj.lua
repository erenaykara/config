local opts = {
    use_default_keymaps = false,
}

local keys = {
    { "cm", function() package.loaded.treesj.toggle() end },
    { "cs", function() package.loaded.treesj.split() end },
    { "cj", function() package.loaded.treesj.join() end },
}

return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = true,
    opts = opts,
    keys = keys,
}
