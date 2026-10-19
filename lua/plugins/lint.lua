vim.pack.add({
  "https://github.com/mfussenegger/nvim-lint",
})

require("lint").linters_by_ft = {
  dockerfile = { "hadolint" },
  json = { "spectral" },
  yaml = { "spectral" },
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("config.lint", { clear = true }),
  callback = function(event)
    if vim.bo[event.buf].buftype == "" then
      vim.api.nvim_buf_call(event.buf, function()
        require("lint").try_lint()
      end)
    end
  end,
})
