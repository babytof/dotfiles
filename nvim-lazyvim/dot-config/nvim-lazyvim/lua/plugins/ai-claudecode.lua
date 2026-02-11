return {
    {
        "coder/claudecode.nvim",
        opts = {},

        -- 🔥 Remplace totalement les keymaps (au lieu de les fusionner)
        keys = function()
            return {
                { "<leader>ak", "", desc = "+claude", mode = { "n", "v" } },

                { "<leader>akc", "<cmd>ClaudeCode<cr>", desc = "Claude: Toggle" },
                { "<leader>akf", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude: Focus" },
                { "<leader>akr", "<cmd>ClaudeCode --resume<cr>", desc = "Claude: Resume" },
                { "<leader>akC", "<cmd>ClaudeCode --continue<cr>", desc = "Claude: Continue" },

                { "<leader>akb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude: Add current buffer" },

                { "<leader>aks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude: Send selection" },

                {
                    "<leader>aks",
                    "<cmd>ClaudeCodeTreeAdd<cr>",
                    desc = "Claude: Add file",
                    ft = { "NvimTree", "neo-tree", "oil" },
                },

                { "<leader>aka", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: Accept diff" },
                { "<leader>akd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude: Deny diff" },
            }
        end,
    },
}
-- return {
--     "coder/claudecode.nvim",
--     opts = {},
--     keys = {
--         { "<leader>ak", "", desc = "+claude", mode = { "n", "v" } },
--
--         { "<leader>akc", "<cmd>ClaudeCode<cr>", desc = "Claude: Toggle" },
--         { "<leader>akf", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude: Focus" },
--         { "<leader>akr", "<cmd>ClaudeCode --resume<cr>", desc = "Claude: Resume" },
--         { "<leader>akC", "<cmd>ClaudeCode --continue<cr>", desc = "Claude: Continue" },
--
--         { "<leader>akb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude: Add current buffer" },
--
--         -- Send selection
--         { "<leader>aks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude: Send selection" },
--
--         -- File explorers: add file
--         {
--             "<leader>aks",
--             "<cmd>ClaudeCodeTreeAdd<cr>",
--             desc = "Claude: Add file",
--             ft = { "NvimTree", "neo-tree", "oil" },
--         },
--
--         -- Diff management
--         { "<leader>aka", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Claude: Accept diff" },
--         { "<leader>akd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Claude: Deny diff" },
--     },
-- }
