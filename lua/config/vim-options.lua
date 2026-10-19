local opt = vim.opt
local g = vim.g

opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

g.mapleader = " "
g.maplocalleader = " "

-- Active spell checking for english
opt.spelllang = "en_us"
opt.spell = true

opt.ignorecase = true

opt.termguicolors = true

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0
