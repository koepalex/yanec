local opt = vim.opt
local g = vim.g

-- set the theme
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha"

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
