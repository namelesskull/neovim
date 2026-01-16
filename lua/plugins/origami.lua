-- lua/plugins/origami.lua
return {
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy", -- lazy load
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
    end,
    opts = {},
    autoFold = {
      enabled = false,
      kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
    },
    foldKeymaps = {
      enabled = false,
    },
  },
}
