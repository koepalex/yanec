vim.pack.add({
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/NeogitOrg/neogit",
})

require("diffview").setup({})

require("neogit").setup({
  integrations = {
    diffview = true,
    telescope = true,
  },
})
