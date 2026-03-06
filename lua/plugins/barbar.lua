return {
    { 
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost" },
        config = function()
            local opts = {
                attach_to_untracked = false,
            }
            require("gitsigns").setup(opts)
        end
    },
    { "nvim-tree/nvim-web-devicons", event = { "BufReadPre", "BufNewFile" } },
	{
		"romgrk/barbar.nvim",
		init = function()
			vim.g.barbar_auto_setup = false
		end,
        event = "UIEnter",
        config = function ()
            local opts = {
                auto_hide = true,
                animation = true,
            }
            require("barbar").setup(opts)
        end
	}
}
