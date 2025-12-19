return {
  "lewis6991/hover.nvim",
  event = "VeryLazy",
  opts = {
    providers = {
      "hover.providers.diagnostic",
      "hover.providers.lsp",
      "hover.providers.dap",
      "hover.providers.man",
      "hover.providers.dictionary",
      {
        module = "hover.providers.diagnostic",
        priority = 2000,
        name = "Diags",
      },
      -- Optional:
      -- 'hover.providers.gh',
      -- 'hover.providers.gh_user',
      -- 'hover.providers.jira',
      -- 'hover.providers.fold_preview',
      -- 'hover.providers.highlight',
    },
    preview_opts = {
      border = "none",
      opacity = "100%",
    },
    preview_window = false,
    title = true,
    mouse_providers = { "hover.providers.lsp" },
    mouse_delay = 1000,
  },
  config = function(_, opts)
    require("hover").config(opts)

    -- Keymaps
    vim.keymap.set("n", "<leader>k", require("hover").open, { desc = "hover.nvim (open)" })
    vim.keymap.set("n", "<leader>M", require("hover").enter, { desc = "hover.nvim (enter)" })
    vim.keymap.set("n", "<C-p>", function()
      require("hover").switch("previous")
    end, { desc = "hover.nvim (previous source)" })
    vim.keymap.set("n", "<C-n>", function()
      require("hover").switch("next")
    end, { desc = "hover.nvim (next source)" })
  end,
}
