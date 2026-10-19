vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
  view = {
    width = 35,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
  },
  diagnostics = {
    enable = false,
  },
})

