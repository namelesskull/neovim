return {
  "akinsho/bufferline.nvim",
  enabled = true,
  opts = function()
    local cwd = vim.fn.getcwd()
    local dir_name = vim.fn.fnamemodify(cwd, ":t")

    return {
      options = {
        show_close_icon = false,
        show_buffer_close_icon = false,
        offsets = {
          {
            filetype = "neo-tree",
            highlight = "Directory",
            text = dir_name,
            text_align = "left",
          },
          {
            filetype = "snacks_layout_box",
          },
        },
      },
    }
  end,
}
