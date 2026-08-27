-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "javascript" then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    vim.schedule(function()
      vim.cmd("BufferLineCloseOthers")
    end)
  end,
})
