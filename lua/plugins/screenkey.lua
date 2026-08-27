return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  config = function()
    require("screenkey").setup({
      win_opts = {
        row = vim.o.lines - vim.o.cmdheight - 1,
        col = vim.o.columns - 2,
        relative = "editor",
        anchor = "SE",
        width = 30,
        height = 1,
        border = "none",
        title = "",
        style = "minimal",
        focusable = false,
        noautocmd = true,
      },

      winblend = 0,

      separator = " ",

      show_leader = false,
      group_mappings = false,

      compress_after = 3,
      clear_after = 2,

      hl_groups = {
        ["screenkey.hl.key"] = { link = "Normal" },
        ["screenkey.hl.map"] = { link = "Normal" },
        ["screenkey.hl.sep"] = { link = "Normal" },
      },
    })
    vim.defer_fn(function()
      require("screenkey").toggle()
    end, 1000)
  end,
}
