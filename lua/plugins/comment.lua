vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/numToStr/Comment.nvim",
    }, { load = true })

    require("Comment").setup({
      toggler = {
        line = "<leader>cc",
        block = "<leader>bc",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
    })
  end,
})
