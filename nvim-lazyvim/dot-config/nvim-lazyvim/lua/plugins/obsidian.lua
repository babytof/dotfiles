return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  --   ObsidianSearch = "obsidian.commands.search",
  keys = {
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "(O)bsidian (S)earch" },
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "(O)bsidian (N)ew note" },
    { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "(O)bsidian (T)oday" },
    { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "(O)bsidian (Y)esterday" },
    { "<leader>or", "<cmd>ObsidianTomorrow<cr>", desc = "(O)bsidian Tomo(r)row" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian/Tof",
      },
      -- {
      -- name = "work",
      -- path = "~/vaults/work",
      -- },
    },
  },
}
