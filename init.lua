
if vim.loader and vim.loader.enable then
  vim.loader.enable()
end

-- load general vim options from lua/config/vim-options.lua
require("config.vim-options")
require("plugins.completions")
require("plugins.pairs")
require("plugins.lsp-config")
require("plugins.formatting")
require("plugins.lint")
require("plugins.treesitter")
require("plugins.markdown-preview")  -- use Vellum
require("plugins.alpha")
require("plugins.lualine")
require("plugins.bufferline")
require("plugins.gitsigns")
require("plugins.leap")
require("plugins.oil")
require("plugins.unicode")
require("plugins.which-key")
require("plugins.noice")
require("plugins.telescope")
require("plugins.neogit")
require("plugins.todo-comments")
require("plugins.aerial")
require("plugins.theme")
require("plugins.transparent")
-- load visual configuration from lua/config/visual.lua
require("config.visual")
-- load keymappings from lua/config/keymap.lua
require("config.keymap")
