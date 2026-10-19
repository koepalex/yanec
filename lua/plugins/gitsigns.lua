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
