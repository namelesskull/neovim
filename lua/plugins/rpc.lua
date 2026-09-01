return {
  "andweeb/presence.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("presence").setup({
      neovim_image_text = "i use Neovim btw.",
    })
  end,
}
