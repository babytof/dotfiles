-- Aider + yarepl.nvim : AI pair programming via aider.chat dans un REPL géré par yarepl
-- Prérequis : `pip install aider-chat` + OPENAI_API_KEY (ou autre fournisseur) configuré
-- Keymaps : <leader>ad + s/f/h/r/y/n/e/... (voir keymaps.lua)
return {
    {
        "milanglacier/yarepl.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>ad", desc = "+aider", mode = { "n", "v" } },
            -- count 1 pour éviter REPL 0 (conflit which-key sur les mappings leader)
            { "<leader>ads", "1<Plug>(REPLStart-aider)", desc = "Aider: start REPL", mode = "n", noremap = false },
            { "<leader>adf", "1<Plug>(REPLFocus-aider)", desc = "Aider: focus REPL", mode = "n", noremap = false },
            { "<leader>adh", "1<Plug>(REPLHide-aider)", desc = "Aider: hide REPL", mode = "n", noremap = false },
            { "<leader>adr", "1<Plug>(REPLSendOperator-aider)", desc = "Aider: send operator", mode = "n", noremap = false },
            { "<leader>adrr", "1<Plug>(REPLSendLine-aider)", desc = "Aider: send line", mode = "n", noremap = false },
            { "<leader>adR", "1<Plug>(REPLSendVisual-aider)", desc = "Aider: send visual", mode = "v", noremap = false },
            -- count 1 pour contourner which-key ; espace pour séparer commande et prompt
            { "<leader>ade", "1<Plug>(AiderExec) ", desc = "Aider: exec prompt", mode = "n", noremap = false },
            -- count 1 pour éviter REPL 0 (conflit which-key)
            { "<leader>ady", "1<Plug>(AiderSendYes)", desc = "Aider: yes", mode = "n", noremap = false },
            { "<leader>adn", "1<Plug>(AiderSendNo)", desc = "Aider: no", mode = "n", noremap = false },
            { "<leader>ada", "1<Plug>(AiderSendAbort)", desc = "Aider: abort", mode = "n", noremap = false },
            { "<leader>adq", "1<Plug>(REPLClose-aider)", desc = "Aider: close REPL", mode = "n", noremap = false },
            { "<leader>adv", "<cmd>Telescope REPLShow<CR>", desc = "Aider: view REPLs", mode = "n" },
        },
        config = function()
            local yarepl = require("yarepl")
            local aider_ext = require("yarepl.extensions.aider")

            aider_ext.setup({
                aider_cmd = "aider",
                -- Pas de liste de fichiers : Aider utilise le repo map (structure git) + peut /run grep et /add
                aider_args = { "--watch-files", "--vim", "--no-auto-commits" },
                show_winbar_in_float_win = false, -- inutile en mode split
                wincmd = "vertical 80 split", -- Aider à droite du code, pas en overlay
            })

            yarepl.setup({
                buflisted = false,
                wincmd = "belowright 15 split",
                scroll_to_bottom_after_sending = true,
                format_repl_buffers_names = true,
                close_on_exit = true,
                metas = {
                    aider = aider_ext.create_aider_meta(),
                },
            })

            -- Charger l'extension Telescope REPLShow (aperçu des REPLs actifs)
            vim.defer_fn(function()
                pcall(require("telescope").load_extension, "REPLShow")
            end, 100)
        end,
    },
}
