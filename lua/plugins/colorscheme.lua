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
        Normal = { bg = "#000000" },
        NormalFloat = { bg = "#000000" },
        SignColumn = { bg = "#000000" },
        FoldColumn = { bg = "#000000" },
        EndOfBuffer = { bg = "#000000" },
      },
    })

    require("onedark").load()
  end,
}
