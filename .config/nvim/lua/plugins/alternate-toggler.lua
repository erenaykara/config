local keys = {
    { "<space>t", function() package.loaded["alternate-toggler"].toggleAlternate() end }
}

return {
    'rmagatti/alternate-toggler',
    config = true,
    keys = keys,
}
