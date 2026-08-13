return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ensure_installed = { "lua", "c_sharp", "markdown_inline", "mermaid", "rust", "yaml", "json" }

        require("nvim-treesitter").setup()
        require("nvim-treesitter").install(ensure_installed)

        -- The new main-branch API no longer auto-enables highlighting/indent via
        -- setup(); enable them per-buffer once a parser is available.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ok = pcall(vim.treesitter.start, args.buf)
                if ok then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}

