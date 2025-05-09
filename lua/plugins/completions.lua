return {
	-- ask every installed LSP for completion information
	{
		"hrsh7th/cmp-nvim-lsp",
		config = function()
			local options = {
				sources = {
					{ name = "nvim_lsp" },
				},
			}
			require("cmp").setup(options)
		end,
	},
	-- Snippet engine
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- completion for the snippets
			"saadparwaiz1/cmp_luasnip",
			-- vscode snippet selection
			"rafamadriz/friendly-snippets",
		},
	},
	-- (snippet) completion and nvim integration
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					-- { name = "nvim_lsp" },
					-- { name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
