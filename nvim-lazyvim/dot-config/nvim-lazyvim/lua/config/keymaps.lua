-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- center cursor on screen when moving
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll downwards" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })

-- find file no ignore
vim.keymap.set("n", "<Leader>fi", "<Cmd>Telescope find_files no_ignore=true<CR>", { desc = "find file no ignore" })

-- GoLang keymaps
vim.keymap.set("n", "<F5>", "<Cmd>GoRun<CR>", { desc = "GoRun current file" })

-- QuickFix
vim.keymap.set("n", "<M-C-j>", "<Cmd>cnext<CR>")
vim.keymap.set("n", "<M-C-k>", "<Cmd>cprev<CR>")

-- Diffview
vim.keymap.set("n", "<Leader>gdo", "<Cmd>DiffviewOpen<CR>", { desc = "Diffview Open" })
vim.keymap.set("n", "<Leader>gdc", "<Cmd>DiffviewClose<CR>", { desc = "Diffview Close" })
vim.keymap.set("n", "<Leader>gdh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Diffview file history" })
vim.keymap.set("n", "<Leader>gdf", "<Cmd>DiffviewFocusFiles<CR>", { desc = "Diffview focus files" })
vim.keymap.set("n", "<Leader>gdl", "<Cmd>DiffviewLog<CR>", { desc = "Diffview log" })
vim.keymap.set("n", "<Leader>gdr", "<Cmd>DiffviewRefresh<CR>", { desc = "Diffview refresh" })
vim.keymap.set("n", "<Leader>gdt", "<Cmd>DiffviewToggleFiles<CR>", { desc = "Diffview toggle files" })

-- Focus neotree
vim.keymap.set("n", "<Leader>we", "<Cmd>Neotree focus<CR>", { desc = "Focus neotree" })
