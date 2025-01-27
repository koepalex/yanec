return {
	-- generic LSP server, that maps formatter, linter internally, fork of null-ls
	-- which is not longer maintained
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.csharpier,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.markdownlint,
				null_ls.builtins.formatting.yamlfmt,
				-- null_ls.builtins.diagnostics.editorconfig_checker,
                null_ls.builtins.diagnostics.hadolint, -- for docker files
                null_ls.builtins.diagnostics.spectral, -- for JSON/YAML
			},
		})
	end,
}
