return {
    {
        "folke/which-key.nvim",
        opts = function(_, opts)
            -- LazyVim utilise opts.spec (WhichKey v3)
            opts.spec = opts.spec or {}

            -- Ajoute tes groupes AI
            vim.list_extend(opts.spec, {
                { "<leader>a", group = "AI" }, -- apparaît sur <leader> : a +AI
                { "<leader>aa", group = "Avante" }, -- apparaît sur <leader>a : a +Avante
                { "<leader>ac", group = "Companion" }, -- apparaît sur <leader>a : c +Companion
                { "<leader>ak", group = "Claude" }, -- apparaît sur <leader>a : k +Claude
                { "<leader>m", group = "MCPHub" }, -- apparaît sur <leader>a : k +Claude
            })
        end,
    },
}
