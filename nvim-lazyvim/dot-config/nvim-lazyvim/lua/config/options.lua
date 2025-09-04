-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false

-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- allow visual block where there is no character
vim.opt.virtualedit = "block"

-- scrolloff : garde le curseur centré lors d'un scroll vertical
-- vim.opt.scrolloff = 99

-- show the effet of substitute (%s/xx/yy/)
-- nosplit	Shows the effects of a command incrementally in the buffer.
-- split	Like "nosplit", but also shows partial off-screen results in a preview window.
vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.termguicolors = true

-- vim.opt.spelllang = "fr"

-- vim.g.lazyvim_php_lsp = "intelephense"
