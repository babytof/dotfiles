-- return {
--     "neovim/nvim-lspconfig",
--     opts = {
--         inlay_hints = { enabled = false },
--         servers = {
--             bashls = {
--                 -- Force la racine au .git
--                 root_dir = require("lspconfig.util").root_pattern(".git"),
--                 settings = {
--                     bashIde = {
--                         globPattern = "**/*@(.sh|.inc|.bash|.command)",
--                         backgroundAnalysisMaxFiles = 2000,
--                         includeAllWorkspaceSymbols = true,
--                         enableSourceErrorDiagnostics = true,
--                     },
--                 },
--             },
--         },
--     },
--     ts_ls = { enabled = true },
-- }
-- return {
--     "neovim/nvim-lspconfig",
--     opts = function(_, opts)
--         opts.inlay_hints = { enabled = false }
--
--         opts.servers = opts.servers or {}
--         opts.servers.bashls = {
--             root_dir = require("lspconfig.util").root_pattern(".git", "bashls-root"),
--             settings = {
--                 bashIde = {
--                     globPattern = "**/*@(.sh|.inc|.bash|.command)",
--                     backgroundAnalysisMaxFiles = 2000,
--                     includeAllWorkspaceSymbols = true,
--                     enableSourceErrorDiagnostics = true,
--                 },
--             },
--         }
--     end,
-- }
-- return {
--     "neovim/nvim-lspconfig",
--     opts = {
--         inlay_hints = { enabled = false },
--         servers = {},
--     },
--     ts_ls = { enabled = true },
-- }
return {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
        -- IMPORTANT: on patch, on ne remplace pas
        opts.servers = opts.servers or {}

        opts.servers.bashls = vim.tbl_deep_extend("force", opts.servers.bashls or {}, {
            settings = {
                bashIde = {
                    globPattern = "**/*@(.sh|.inc|.bash|.command)",
                    backgroundAnalysisMaxFiles = 2000,
                    includeAllWorkspaceSymbols = true,
                    enableSourceErrorDiagnostics = true,
                },
            },
        })
        opts.servers.lua_ls = vim.tbl_deep_extend("force", opts.servers.lua_ls or {}, {
            settings = {
                Lua = {
                    -- declare 'vim' as a global variable to avoid warning
                    diagnostics = { globals = { "vim" } },
                },
            },
        })
    end,
}
