return {
    -- load different LSP servers
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    -- configuration API for mason
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "csharp_ls", "jsonls", "marksman", "rust_analyzer", "yamlls"}
            })
        end
    },
    -- LSP client for neovim
    {
        "neovim/nvim-lspconfig",
        config = function() 
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = vim.lsp.config
            lspconfig('lua_ls',{
                capabilities = capabilities
            })
            lspconfig('csharp_ls', {
                capabilities = capabilities
            })
            lspconfig('jsonls', {
                capabilities = capabilities
            })
            lspconfig('marksman', {
                capabilities = capabilities
            })
            lspconfig('yamlls', {
                capabilities = capabilities
            })
            lspconfig('rust_analyzer', {
                capabilities = capabilities,
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = {
                            command = "clippy"
                        },
                    }
                }
            })
            lspconfig('pyright', {
                filetypes = { "python" },
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "strict",
                            diagnosticMode = "workspace",
                        }
                    }
                }
            })
        end
    }
}
