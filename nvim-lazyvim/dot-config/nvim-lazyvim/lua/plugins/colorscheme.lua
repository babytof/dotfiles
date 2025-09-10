return {
    { "projekt0n/caret.nvim" },
    { "neanias/everforest-nvim" },
    {
        "adisen99/apprentice.nvim",
        dependencies = { "rktjmp/lush.nvim" },
    },
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        -- tag = "vX.0.0",
        opts = {
            -- Your configuration options here.
        },
    },
    { "rebelot/kanagawa.nvim" },
    { "projekt0n/github-nvim-theme", name = "github-theme" },
    { "agude/vim-eldar" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- config = function()
        -- 	vim.cmd("colorscheme rose-pine")
        -- end
    },
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "kanagawa",
            -- colorscheme = "rose-pine",
            colorscheme = "apprentice",
        },
    },
    -- Nord
    {
        "shaunsingh/nord.nvim",
        lazy = true, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        enable = false,
        config = function()
            -- Example config in lua
            vim.g.nord_contrast = true -- Make sidebars and popup menus like nvim-tree and telescope have a different background
            vim.g.nord_borders = false -- Enable the border between verticaly split windows visable
            vim.g.nord_disable_background = true -- Disable the setting of background color so that NeoVim can use your terminal background
            vim.g.set_cursorline_transparent = false -- Set the cursorline transparent/visible
            vim.g.nord_italic = false -- enables/disables italics
            vim.g.nord_enable_sidebar_background = false -- Re-enables the background of the sidebar if you disabled the background of everything
            vim.g.nord_uniform_diff_background = true -- enables/disables colorful backgrounds when used in diff mode
            vim.g.nord_bold = false -- enables/disables bold

            -- Load the colorscheme
            require("nord").set()

            -- Function to set menu borders to transparent
            -- local set_menu_border_transparency = function()
            --   vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = 'NONE' })
            --   vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = 'NONE' })
            -- end

            -- Execute the function once after loading the colorscheme
            -- set_menu_border_transparency()

            local bg_transparent = true

            -- Toggle background transparency
            local toggle_transparency = function()
                bg_transparent = not bg_transparent
                vim.g.nord_disable_background = bg_transparent
                vim.cmd([[colorscheme nord]])
                -- set_menu_border_transparency()
            end

            vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
        end,
    },
}
--[=====[

    -- onedark
    {
        "navarasu/onedark.nvim",
        commit = "dd640f6",
        priority = 1000,
        lazy = true,
        enabled = false,
        config = function()
            -- vim.cmd.colorscheme 'onedark'

            local config = {
                -- Main options --
                style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                transparent = true, -- Show/hide background
                term_colors = true, -- Change terminal color as per the selected theme style
                ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

                -- toggle theme style ---
                toggle_style_key = "<leader>th", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
                toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

                -- Change code style ---
                -- Options are italic, bold, underline, none
                -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
                code_style = {
                    comments = "italic",
                    keywords = "none",
                    functions = "none",
                    strings = "none",
                    variables = "none",
                },

                -- Lualine options --
                lualine = {
                    transparent = false, -- lualine center bar transparency
                },

                -- Custom Highlights --
                colors = {
                    -- purple = '#56b6c2',
                }, -- Override default colors
                highlights = {}, -- Override highlight groups

                -- Plugins Config --
                diagnostics = {
                    darker = true, -- darker colors for diagnostic
                    undercurl = true, -- use undercurl instead of underline for diagnostics
                    background = true, -- use background color for virtual text
                },
            }

            local onedark = require("onedark")
            onedark.setup(config)
            onedark.load()

            -- Make the background of diagnostics messages transparent
            local set_diagnostics_bg_transparency = function()
                vim.cmd([[highlight DiagnosticVirtualTextError guibg=none]])
                vim.cmd([[highlight DiagnosticVirtualTextWarn guibg=none]])
                vim.cmd([[highlight DiagnosticVirtualTextInfo guibg=none]])
                vim.cmd([[highlight DiagnosticVirtualTextHint guibg=none]])
            end
            set_diagnostics_bg_transparency()

            -- Toggle background transparency
            local toggle_transparency = function()
                config.transparent = not config.transparent
                onedark.setup(config)
                onedark.load()
                set_diagnostics_bg_transparency()
            end

            vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
        end,
    },
}

--]=====]
