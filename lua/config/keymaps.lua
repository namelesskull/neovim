vim.keymap.set("n", "<leader>fe", ":Neotree<CR>", { desc = "Focus Explorer" })
vim.keymap.set("n", "<leader>fw", ":NvimTreeFindFile<CR>", { desc = "Focus Current File in Explorer" })
vim.keymap.set("n", "<leader>bd", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("bprevious")
    vim.cmd("bdelete #")
  else
    print("Cannot Close last buffer")
  end
end, { noremap = true, silent = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
