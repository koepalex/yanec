vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://codeberg.org/andyg/leap.nvim",
    }, { load = true })

    require("leap").setup({})
  end,
})
