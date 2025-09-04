return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
  keys = {
    {
      "<Leader>l",
      function()
        require("lsp_lines").toggle()
      end,
      desc = "Toggle lsp_lines",
    },
  },
}
