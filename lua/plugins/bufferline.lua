vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-tree/nvim-web-devicons",
      "https://github.com/akinsho/bufferline.nvim",
    }, { load = true })

    require("bufferline").setup({
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File explorer",
            text_align = "left",
          },
        },
      },
    })
  end,
})
