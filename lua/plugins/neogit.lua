require("config.lazy-command")(function()
  require("plugins.telescope").load()
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
end, {
  Neogit = {},
  NeogitResetState = {},
  NeogitLogCurrent = { nargs = "?", range = "%", complete = "file" },
  NeogitCommit = { nargs = "?" },
  DiffviewOpen = {},
  DiffviewFileHistory = { range = true },
  DiffviewClose = { nargs = 0, bang = true },
  DiffviewFocusFiles = { nargs = 0, bang = true },
  DiffviewToggleFiles = { nargs = 0, bang = true },
  DiffviewRefresh = { nargs = 0, bang = true },
  DiffviewLog = { nargs = 0, bang = true },
})
