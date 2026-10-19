vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/chrisbra/unicode.vim",
    }, { load = true })
  end,
})
