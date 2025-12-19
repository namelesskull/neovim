-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.o.showcmd = true
vim.o.showcmdloc = "statusline"

vim.api.nvim_create_user_command("FilePwd", function()
  print(vim.fn.expand("%:p:h"))
end, {})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.mouse = ""

vim.keymap.set("n", "<C-e>", "5<C-e>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-y>", "5<C-y>", { noremap = true, silent = true })
