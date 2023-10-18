local function config()
    local lualine = require('lualine')

    local colors = {
        bg       = '#2d3233',
        fg       = '#bbc2cf',
        yellow   = '#ECBE7B',
        cyan     = '#04c7c7',
        darkblue = '#081633',
        green    = '#8ce33b',
        orange   = '#FF8800',
        violet   = '#a9a1e1',
        magenta  = '#c678dd',
        blue     = '#51afef',
        red      = '#ec5f67',
    }

    local conditions = {
        buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
        treesitter_support = function()
            return package.loaded["nvim-treesitter"] ~= nil and
                require("nvim-treesitter.ts_utils").get_node_at_cursor() ~= nil
        end,
        in_terminal_mode = function()
            local mode = vim.api.nvim_get_mode().mode
            return mode == "t" or mode == "nt"
        end
    }

    -- Config
    local config_table = {
        options = {
            -- Disable sections and component separators
            component_separators = '',
            section_separators = '',
            theme = {
                -- We are going to use lualine_c an lualine_x as left and
                -- right section. Both are highlighted by c theme .  So we
                -- are just setting default looks o statusline
                normal = { c = { fg = colors.fg, bg = colors.bg } },
                inactive = { c = { fg = colors.fg, bg = colors.bg } },
            },
        },
        sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            -- These will be filled later
            lualine_c = {},
            lualine_x = {},
        },
        inactive_sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        },
    }

    -- Inserts a component in lualine_c at left section
    local function ins_left(component)
        table.insert(config_table.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function ins_right(component)
        table.insert(config_table.sections.lualine_x, component)
    end

    -- auto change color according to neovims mode
    local mode_color = {
        n = colors.green,
        i = colors.orange,
        v = colors.magenta,
        [''] = colors.magenta,
        V = colors.magenta,
        c = colors.cyan,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        [''] = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
        nt = colors.white,

        MultiNormal = colors.yellow,
        MultiVisual = colors.orange,
        MultiInsert = colors.green,
    }

    local function get_mode_name()
        local name = vim.api.nvim_get_mode().mode

        if vim.g.libmodalActiveModeName then
            name = vim.g.libmodalActiveModeName
        end

        return name
    end

    local function get_mode_color()
        return mode_color[get_mode_name()]
    end

    local function get_node_type()
        if package.loaded["nvim-treesitter"] ~= nil then
            local node = require("nvim-treesitter.ts_utils").get_node_at_cursor();
            if node ~= nil then
                return node:type()
            end
        end
    end

    ins_left {
        function()
            return '▊'
        end,
        color = function()
            local color = get_mode_color()
            return { fg = color }
        end,
        padding = { left = 0, right = 1 }, -- We don't need space before this
    }

    ins_left {
        'filename',
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        cond = conditions.buffer_not_empty,
        color = function()
            local color = get_mode_color()
            return { fg = color, gui = 'bold' }
        end,
    }

    ins_left {
        'location',
        color = function()
            local color = get_mode_color()
            return { fg = color, gui = 'bold' }
        end,
    }

    ins_left {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
            error = { fg = colors.red },
            warn = { fg = colors.yellow },
            info = { fg = colors.yellow },
        },
    }

    ins_left {
        function()
            local keymaps = vim.api.nvim_buf_get_keymap(0, "t")
            if is_keymap_present(keymaps, "<Esc>") then
                return "󰿆"
            else
                return "󰌾"
            end
        end,
        cond = conditions.in_terminal_mode,
        color = function()
            local color = get_mode_color()
            return { fg = color, gui = 'bold' }
        end,
    }

    -- Add components to right sections

    ins_right {
        get_node_type,
        icon = '󰔱',
        cond = conditions.treesitter_support,
    }

    ins_right {
        'branch',
        icon = '',
    }

    ins_right {
        'diff',
        -- Is it me or the symbol for modified us really weird
        symbols = { added = ' ', modified = '柳 ', removed = ' ' },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
    }

    ins_right {
        function()
            return '▊'
        end,
        color = function()
            return { fg = mode_color[vim.fn.mode()] }
        end,
        padding = { left = 1 },
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config_table)

    -- Don't show --MODE-- and position
    vim.api.nvim_command("set noru")
    vim.api.nvim_command("set nosmd")

    -- Update the statusline when entering a libmodal mode
    vim.api.nvim_create_autocmd('ModeChanged', {
        callback = function()
            require('lualine').refresh { scope = 'window', place = { 'statusline' } }
        end
    })
end


return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = config,
}
