local parsers = {
  "lua", "c_sharp", "markdown", "markdown_inline", "mermaid", "rust", "yaml", "json"
}

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("config.treesitter.update", { clear = true }),
  callback = function(event)
    if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
      if not event.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      require("nvim-treesitter").update(parsers):wait(300000)
    end
  end,
})

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("config.treesitter", { clear = true }),
  callback = function(event)
    local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
    if vim.tbl_contains(parsers, language) then
      vim.treesitter.start(event.buf, language)
      vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
