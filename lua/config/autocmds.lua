-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
    local hl = vim.api.nvim_set_hl

    -- Cursor & selection
    hl(0, "NeoTreeCursorLine", { bg = "#1C2541" })
    hl(0, "NeoTreeRootName", { fg = "#7daea3", bold = true })

    -- ===== Files & folders =====
    hl(0, "NeoTreeDirectoryName", { fg = "#f0f4ef" })
    hl(0, "NeoTreeDirectoryIcon", { fg = "#3581B8" })
    hl(0, "NeoTreeFileName", { fg = "#f4f9e9" })
    hl(0, "NeoTreeFileIcon", { fg = "#c6c6c6" })

    -- Active file
    hl(0, "NeoTreeFileNameOpened", { fg = "#a6dbff", bold = true })

    -- ===== Git status =====
    hl(0, "NeoTreeGitAdded", { fg = "#a3d9a5" })
    hl(0, "NeoTreeGitModified", { fg = "#e5c07b" })
    hl(0, "NeoTreeGitDeleted", { fg = "#e06c75" })
    hl(0, "NeoTreeGitUntracked", { fg = "#7daea3" })
    hl(0, "NeoTreeGitIgnored", { fg = "#5c6370" })

    -- ===== Diagnostics =====
    hl(0, "NeoTreeDiagnosticError", { fg = "#ff6c6b" })
    hl(0, "NeoTreeDiagnosticWarn", { fg = "#ECBE7B" })
    hl(0, "NeoTreeDiagnosticInfo", { fg = "#51afef" })
    hl(0, "NeoTreeDiagnosticHint", { fg = "#98be65" })

    -- ===== Line-Tree =======
    vim.api.nvim_set_hl(0, "NeoTreeIndentMarker", { fg = "#747C92" })
    vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#d1d1d1" })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "javascript" then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})
