-- return {
--   "bluz71/vim-moonfly-colors",
--   name = "moonfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme moonfly")
--   end,
-- }
--
-- Using Lazy
return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "warmer",
      code_style = {
        comments = "none",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      highlights = {
        NeoTreeNormal = { bg = "#000000" },
        NeoTreeNormalNC = { bg = "#000000" },
        NeoTreeEndOfBuffer = { bg = "#000000" },
        NeoTreeWinSeparator = { bg = "#000000", fg = "#324376" },
        TreesitterContext = { bg = "#30323D" },
        Normal = { bg = "#000000" },
        NormalFloat = { bg = "#000000" },
        FloatBorder = { bg = "#000000", fg = "#6FD08C" },
        SignColumn = { bg = "#000000" },
        FoldColumn = { bg = "#000000" },
        EndOfBuffer = { bg = "#000000" },
      },
    })

    require("onedark").load()
  end,
}
