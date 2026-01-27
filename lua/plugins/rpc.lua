return {
  "andweeb/presence.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("presence").setup()
  end,
}
