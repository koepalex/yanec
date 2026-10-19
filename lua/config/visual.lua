local opt = vim.opt
-- set the theme
require("tokyonight").setup({
  style = "moon",
  transparent = true,
})
vim.cmd.colorscheme "tokyonight-moon"

-- enable transparent background
vim.cmd(":TransparentEnable")

-- show line numbers
opt.number = true
-- use relative line numbers
opt.relativenumber = true
-- show vertical column at 80 and 120 characters
opt.colorcolumn = "80,120"
-- show at least 8 lines
opt.scrolloff = 8
