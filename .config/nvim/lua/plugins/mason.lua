local function config()
    require("mason").setup()
    require("mason-lspconfig").setup()
end

return {
    'williamboman/mason.nvim',
    dependencies = 'williamboman/mason-lspconfig.nvim',
    config = config,
    cmd = "Mason",
    event = { "BufRead", "BufNewFile" },
}
