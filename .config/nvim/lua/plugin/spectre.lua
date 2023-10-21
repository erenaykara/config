local keys = {
    { 'se', function() package.loaded.spectre.toggle() end, desc = "Search and replace in working directory" },
    {
        'se',
        function() package.loaded.spectre.open_visual() end,
        mode = 'v',
        desc =
        "Substitute everywhere"
    },
}

return {
    'nvim-pack/nvim-spectre',
    dependencies = 'nvim-lua/plenary.nvim',
    keys = keys,
}
