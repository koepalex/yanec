vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
vim.opt.complete = { ".", "w", "b" }
vim.opt.autocomplete = true
vim.opt.autocompletedelay = 100

vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn.complete_info({ "selected" }).selected == -1 and "<C-n><C-y>" or "<C-y>"
  end
  if vim.snippet.active({ direction = 1 }) then
    return "<Cmd>lua vim.snippet.jump(1)<CR>"
  end
  return "<Tab>"
end, { expr = true, desc = "Accept completion or jump to next snippet placeholder" })

local group = vim.api.nvim_create_augroup("config.completion", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "TelescopePrompt",
  callback = function(event)
    vim.bo[event.buf].autocomplete = false
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    if client:supports_method("textDocument/completion") then
      -- 'autocomplete' schedules completion through omnifunc.
      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = false,
      })
      vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      vim.opt_local.complete:append("o")

      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end, { buffer = event.buf, desc = "LSP completion" })
    end
  end,
})
