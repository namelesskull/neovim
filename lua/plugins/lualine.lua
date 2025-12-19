return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.sections.lualine_a = {
      {
        function()
          return " Vim"
        end,
        separator = { left = "" },
        right_padding = 2,
      },
    }

    local colors = {
      blue = "#80a0ff",
      cyan = "#79dac8",
      black = "#080808",
      white = "#c6c6c6",
      red = "#ff5189",
      violet = "#d183e8",
      grey = "#303030",
      mint = "#f1fffa",
      aquamarine = "#5dfdcb",
      charcoal = "#454955",
      emerlad = "#23ce6b",
      neovim = "#019833",
      neovim_text = "#d1d1d0",
      aquacyan = "#255957",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    local icons = LazyVim.config.icons

    -- begin winbar
    opts.winbar = {
      lualine_y = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      },
      lualine_x = {
        Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
          },
      },
      lualine_c = {
        {
          "mode",
          fmt = function(str)
            local map = {
              ["NORMAL"] = "NOR",
              ["INSERT"] = "INS",
              ["VISUAL"] = "VIS",
              ["V-LINE"] = "VLI",
              ["V-BLOCK"] = "VBL",
              ["COMMAND"] = "CMD",
              ["REPLACE"] = "REPL",
              ["SELECT"] = "SEL",
              ["TERMINAL"] = "TERM",
            }

            local icon = ""
            return icon .. " " .. (map[str] or str)
          end,
        },
        { "progress" },
        { "location", padding = { left = 0, right = 1 } },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
    }

    opts.inactive_winbar = {
      lualine_c = {
        LazyVim.lualine.root_dir(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      },
      lualine_x = {
        Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
          },
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
      lualine_y = {
        {
          "progress",
          separator = { left = "" },
          padding = { left = 1, right = 0 },
        },
        { "location", padding = { left = 0, right = 1 } },
      },
    }
    -- end winbar

    opts.options = {
      theme = bubbles_theme,
      component_separators = "|",
      section_separators = { left = "", right = "" },
    }
    opts.sections.lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
        separator = { right = "" },
        left_padding = 2,
      },
    }
    opts.options.disabled_filetypes = opts.options.disabled_filetypes or {}
    opts.options.disabled_filetypes.winbar = {
      "neo-tree",
      "dashboard",
      "alpha",
      "lazy",
      "mason",
      "help",
    }

    local quotes = {
      "Talk is cheap, show me the code.",
    }

    local buf_quotes = {}

    local quote_component = {
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        if not buf_quotes[bufnr] then
          math.randomseed(os.time() + bufnr)
          buf_quotes[bufnr] = quotes[math.random(#quotes)]
        end
        return buf_quotes[bufnr]
      end,
      color = { fg = "#fbf9ff", gui = "bold" },
    }

    opts.sections.lualine_x = {
      function()
        return vim.g.media_status or ""
      end,
    }
    opts.sections.lualine_y = { "hostname" }

    opts.sections.lualine_b = { "branch" }
    opts.sections.lualine_c = { "encoding", "filesize", quote_component }

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        math.randomseed(os.time() + bufnr)
        buf_quotes[bufnr] = quotes[math.random(#quotes)]
        vim.cmd("redrawstatus")
      end,
    })
  end,
}
