vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-tree/nvim-web-devicons",
      "https://github.com/nvim-lualine/lualine.nvim",
    }, { load = true })

    require("lualine").setup({
      options = {
        theme = "dracula",
      },
    })
  end,
})
