return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    highlight = {
      NoiceCmdlinePopup = { bg = "#fe1e2e", fg = "#ffffff" },
      NoiceCmdlinePopupBorder = { fg = "#ffffff" },
      NoiceCmdlinePopupTitle = { fg = "#ffffff" },
    },

    cmdline = {
      format = {
        -- cmdline = { icon = "滅", title = "" },
        -- cmdline = { icon = "⚔ ", title = "" },
        cmdline = { icon = "_", title = "" },
        search_down = { icon = "" },
        search_up = { icon = "" },
        filter = { icon = "" },
        lua = { icon = "" },
        replace = { icon = "" },
      },
    },

    views = {
      cmdline_popup = {
        relative = "editor",
        position = { row = "100%", col = 0 },
        size = { width = 30, height = "auto" },
        border = { style = "none" },

        win_options = {
          winblend = 0,
        },
      },

      popupmenu = {
        relative = "editor",
        position = { row = 8, col = "50%" },
        size = { width = 60, height = 10 },
        border = { style = "single", padding = { 0, 1 } },
        win_options = {
          winhighlight = table.concat({
            "Normal:NoiceCmdlinePopup",
            "FloatBorder:NoiceCmdlinePopupBorder",
            "FloatTitle:NoiceCmdlinePopupTitle",
          }, ","),
        },
      },
    },

    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
  },
}
