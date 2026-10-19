vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/folke/which-key.nvim",
    }, { load = true })

    require("which-key").setup({})
  end,
})
