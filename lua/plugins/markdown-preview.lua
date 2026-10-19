vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "vellum.nvim"
      and (ev.data.kind == "install" or ev.data.kind == "update")
    then
      dofile(ev.data.path .. "/build.lua")
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/blackhat-7/vellum.nvim",
    }, { load = true })

    require("vellum").setup({
      max_width = 100,
    })
  end,
})
