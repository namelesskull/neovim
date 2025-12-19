vim.keymap.set("i", "<C-\\>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-\\>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fe", ":Neotree<CR>", { desc = "Focus Explorer" })
vim.keymap.set("n", "<leader>fw", ":NvimTreeFindFile<CR>", { desc = "Focus Current File in Explorer" })
vim.keymap.set("i", "<C-o>a", function()
  return vim.api.nvim_replace_termcodes("<C-_>", true, true, true)
end, { expr = true })

vim.keymap.set("n", "<leader>rr", function()
  vim.lsp.buf.rename()
end, { desc = "LSP Rename" })

vim.keymap.set("n", "yp", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics == 0 then
    return
  end
  local msg = table.concat(
    vim.tbl_map(function(d)
      return d.message
    end, diagnostics),
    "\n"
  )
  vim.fn.setreg("+", msg)
  vim.notify(msg, vim.log.levels.INFO, { title = "Copied LSP Error" })
end, { desc = "Copy all LSP error messages on current line" })

vim.keymap.set("n", "<leader>bd", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("bprevious")
    vim.cmd("bdelete #")
  else
    print("Cannot Close last buffer")
  end
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "v",
  "<leader>vf",
  [[:lua require('ts_utils').select_function()<CR>]],
  { noremap = true, silent = true }
)
local M = {}

M.select_function = function()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()
  while node do
    local type = node:type()
    if type:match("function") then
      ts_utils.select_node(node)
      break
    end
    node = node:parent()
  end
end

return M

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
