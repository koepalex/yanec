vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    cs = { "csharpier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    json5 = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "yamlfmt" },
    markdown = { "prettier", "markdownlint" },
    ["markdown.mdx"] = { "prettier" },
    graphql = { "prettier" },
    handlebars = { "prettier" },
    svelte = { "prettier" },
    astro = { "prettier" },
    htmlangular = { "prettier" },
  },
})
