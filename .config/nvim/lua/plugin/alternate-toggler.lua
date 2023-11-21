local opts = {
    alternates = {
        yes = "no",
        always = "never",
    }
}

local keys = {
    { "ht", function() package.loaded["alternate-toggler"].toggleAlternate() end }
}

return {
    'rmagatti/alternate-toggler',
    config = true,
    opts = opts,
    keys = keys,
}
