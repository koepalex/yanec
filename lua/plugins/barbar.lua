vim.g.barbar_auto_setup = false

vim.api.nvim_create_autocmd("BufReadPost", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/lewis6991/gitsigns.nvim",
    }, { load = true })

    require("gitsigns").setup({
      attach_to_untracked = false,
    })
  end,
})

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-tree/nvim-web-devicons",
      "https://github.com/romgrk/barbar.nvim",
    }, { load = true })

    require("barbar").setup({
      auto_hide = true,
      animation = true,
    })
  end,
})
