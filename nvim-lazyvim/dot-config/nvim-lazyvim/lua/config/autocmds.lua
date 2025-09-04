-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://github.com/LazyVim/LazyVim/discussions/141
-- Autoformat setting
local set_autoformat = function(pattern, bool_val)
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = pattern,
        callback = function()
            vim.b.autoformat = bool_val
        end,
    })
end
set_autoformat({ "sh" }, false)

-- Disable cursorline on non active pane/windows
local cl_var = "auto_cursorline"

vim.api.nvim_create_autocmd({ "WinEnter", "FocusGained" }, {
    group = vim.api.nvim_create_augroup("enable_auto_cursorline", { clear = true }),
    callback = function()
        local ok, cl = pcall(vim.api.nvim_win_get_var, 0, cl_var)
        if ok and cl then
            vim.api.nvim_win_del_var(0, cl_var)
            vim.o.cursorline = true
        end
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
    group = vim.api.nvim_create_augroup("disable_auto_cursorline", { clear = true }),
    callback = function()
        local cl = vim.o.cursorline
        if cl then
            vim.api.nvim_win_set_var(0, cl_var, cl)
            vim.o.cursorline = false
        end
    end,
})
