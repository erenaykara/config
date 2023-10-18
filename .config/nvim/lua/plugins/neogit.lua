local keys = {
    { "mm", function() package.loaded.neogit.open() end },
}

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    --"sindrets/diffview.nvim",        -- optional
    --"ibhagwan/fzf-lua",              -- optional
  },
  config = true,
  keys = keys,
}
