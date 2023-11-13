local function config()
    local palette = require('monokai').soda
    local monokai_config = {
        palette = palette,
        custom_hlgroups = {
            Normal = {
                bg = "NONE",
            },
            Visual = {
                bg = palette.orange,
                fg = palette.base2,
            },
            ["@field"] = {
                fg = palette.red,
            },
            ["@function.call"] = {
                fg = palette.green,
            },
            DiagnosticSignError = {
                bg = palette.base2,
            },
            DiagnosticSignWarn = {
                bg = palette.base2,
            },
            DiagnosticSignInfo = {
                bg = palette.base2,
            },
            DiagnosticSignHint = {
                bg = palette.base2,
            },
            DiagnosticUnderlineError = {
                style = 'strikethrough',
                fg = palette.red,
            },
            DiagnosticUnderlineWarn = {
                style = 'strikethrough',
                fg = palette.yellow,
            },
            DiagnosticUnderlineInfo = {
                style = 'strikethrough',
                fg = palette.white,
            },
            DiagnosticUnderlineHint = {
                style = 'strikethrough',
                fg = palette.aqua,
            },
            GitSignsAdd = {
                fg = palette.green,
                bg = palette.base2,
            },
            GitSignsAddLn = {
                fg = palette.green,
                bg = palette.base2,
            },
            GitSignsChange = {
                fg = palette.yellow,
                bg = palette.base2,
            },
            GitSignsDelete = {
                fg = palette.red,
                bg = palette.base2,
            },
            GitSignsDeleteLn = {
                fg = palette.red,
                bg = palette.base2,
            },
            Folded = {
                bg = palette.base4,
                fg = palette.orange,
            },
            NoiceCmdlineIcon = {
                fg = palette.aqua,
            },
            NoiceCmdlineIconSearch = {
                fg = palette.orange,
            },
            NoiceFormatConfirmDefault = {
                fg = palette.orange,
            },
            NoiceFormatConfirm = {
                fg = palette.white,
            },
            NoiceFormatProgressDone = {
                bg = palette.orange,
            },
            NoiceFormatProgressTodo = {
                bg = palette.base2,
            },
            NoiceLspProgressSpinner = {
                bg = palette.base2,
                fg = palette.orange,
            },
            NoiceLspProgressTitle = {
                bg = palette.base2,
                fg = palette.white,
            },
            NoiceLspProgressClient = {
                bg = palette.base2,
                fg = palette.orange,
            },
            NoiceMini = {
                bg = palette.base2,
            },
        }
    }

    require('monokai').setup(monokai_config)
end


return {
    'tanvirtin/monokai.nvim',
    priority = 1000,
    config = config,
}
