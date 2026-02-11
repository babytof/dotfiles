-- Avante remap en <leader>aa? (3 lettres après <leader>) en remplaçant les keys de l'Extra
return {
    {
        "yetone/avante.nvim",
        opts = {
            -- Validation avant modification (style Cursor) : demander confirmation avant tools et ne pas auto-appliquer les diffs
            behaviour = {
                -- auto_approve_tool_permissions = true,
                auto_apply_diff_after_generation = false,
            },
        },

        -- ✅ Remplace totalement les keymaps (évite la fusion avec ceux de LazyVim Extras)
        keys = function()
            return {
                { "<leader>aa", "", desc = "+avante", mode = { "n", "v" } },

                { "<leader>aaa", "<cmd>AvanteAsk<CR>", desc = "Avante: Ask" },
                { "<leader>aac", "<cmd>AvanteChat<CR>", desc = "Avante: Chat" },
                { "<leader>aae", "<cmd>AvanteEdit<CR>", desc = "Avante: Edit" },
                { "<leader>aaf", "<cmd>AvanteFocus<CR>", desc = "Avante: Focus" },
                { "<leader>aah", "<cmd>AvanteHistory<CR>", desc = "Avante: History" },
                { "<leader>aam", "<cmd>AvanteModels<CR>", desc = "Avante: Models" },
                { "<leader>aan", "<cmd>AvanteChatNew<CR>", desc = "Avante: New chat" },
                { "<leader>aap", "<cmd>AvanteSwitchProvider<CR>", desc = "Avante: Switch provider" },
                { "<leader>aar", "<cmd>AvanteRefresh<CR>", desc = "Avante: Refresh" },
                { "<leader>aas", "<cmd>AvanteStop<CR>", desc = "Avante: Stop" },
                { "<leader>aat", "<cmd>AvanteToggle<CR>", desc = "Avante: Toggle" },
            }
        end,
    },
}
-- return {
--     "yetone/avante.nvim",
--     build = vim.fn.has("win32") ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
--         or "make",
--     event = "VeryLazy",
--     opts = {
--         provider = "copilot",
--         selection = {
--             hint_display = "none",
--         },
--         behaviour = {
--             auto_set_keymaps = false,
--         },
--     },
--     cmd = {
--         "AvanteAsk",
--         "AvanteBuild",
--         "AvanteChat",
--         "AvanteClear",
--         "AvanteEdit",
--         "AvanteFocus",
--         "AvanteHistory",
--         "AvanteModels",
--         "AvanteRefresh",
--         "AvanteShowRepoMap",
--         "AvanteStop",
--         "AvanteSwitchProvider",
--         "AvanteToggle",
--     },
--     keys = {
--         { "<leader>aa", "", desc = "+avante", mode = { "n", "v" } },
--
--         { "<leader>aaa", "<cmd>AvanteAsk<CR>", desc = "Avante: Ask" },
--         { "<leader>aac", "<cmd>AvanteChat<CR>", desc = "Avante: Chat" },
--         { "<leader>aae", "<cmd>AvanteEdit<CR>", desc = "Avante: Edit" },
--         { "<leader>aaf", "<cmd>AvanteFocus<CR>", desc = "Avante: Focus" },
--         { "<leader>aah", "<cmd>AvanteHistory<CR>", desc = "Avante: History" },
--         { "<leader>aam", "<cmd>AvanteModels<CR>", desc = "Avante: Models" },
--         { "<leader>aan", "<cmd>AvanteChatNew<CR>", desc = "Avante: New chat" },
--         { "<leader>aap", "<cmd>AvanteSwitchProvider<CR>", desc = "Avante: Switch provider" },
--         { "<leader>aar", "<cmd>AvanteRefresh<CR>", desc = "Avante: Refresh" },
--         { "<leader>aas", "<cmd>AvanteStop<CR>", desc = "Avante: Stop" },
--         { "<leader>aat", "<cmd>AvanteToggle<CR>", desc = "Avante: Toggle" },
--     },
-- }
