vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
        diagnosticMode = "workspace",
      },
    },
  },
})

vim.lsp.config("yamlls", {
  filetypes = { "yaml" },
})

vim.lsp.config("marksman", {
  filetypes = { "markdown" },
})

vim.lsp.enable({
  "lua_ls",
  "csharp_ls",
  "jsonls",
  "marksman",
  "yamlls",
  "rust_analyzer",
  "pyright",
})
