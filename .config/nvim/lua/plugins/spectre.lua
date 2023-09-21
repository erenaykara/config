local keys = {
    { 'se', function() package.loaded.spectre.toggle() end },
    { 'se', function() package.loaded.spectre.open_visual() end, mode = 'v' },
}

return {
    'nvim-pack/nvim-spectre',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = keys,
}
