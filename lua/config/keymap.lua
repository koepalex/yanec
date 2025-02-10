local keymap = vim.keymap
local diag = vim.diagnostic
local lsp = vim.lsp

-- fuzzy finding using telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "fuzzy [f]ind [f]iles"})
keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "fuzzy [l]ive [g]rep content in workspace files"})

-- file explorer and motions
keymap.set("n", "<leader>e", ":Neotree toggle reveal left<CR>", { desc = "show/hide file [e]xplorer" })
keymap.set("n", "-", ":Oil<CR>", { desc = "open parent folder as buffer" })
keymap.set("n", "s", "<Plug>(leap-forward)", { desc = "leap [s]earch forward" })
keymap.set("n", "S", "<Plug>(leap-backward)", { desc = "leap [s]earch backward" })

-- LSP key maps
keymap.set("n", "K", lsp.buf.hover, { desc = "hover documentation of symbol" })
keymap.set("n", "gd", lsp.buf.definition, { desc = "[g]oto [d]efinition of symbol" })
keymap.set("n", "gD", lsp.buf.declaration, { desc = "[g]oto [D]eclaration of symbol" })
keymap.set("n", "gr", lsp.buf.references, { desc = "[g]oto [R]eferences of symbol" })
keymap.set("n", "<leader>sh", lsp.buf.signature_help, { desc = "show [s]ignature [h]elp of symbol" })

keymap.set("n", "<leader>ne", diag.goto_next, { desc = "jump to [n]ext [e]rror" })
keymap.set("n", "<leader>pe", diag.goto_prev, { desc = "jump to [p]revious [e]rror" })
keymap.set("n", "<leader>se", diag.open_float, { desc = "[s]how [e]rrors in floating window" })

keymap.set("n", "<leader>ca", lsp.buf.code_action, { desc = "show [c]ode [a]ctions" })
keymap.set("n", "<leader>rn", lsp.buf.rename, { desc = "[r]e[n]ame symbol" })
keymap.set("n", "<leader>f", lsp.buf.format, { desc = "[f]ormatting file" })

-- advanced editing
keymap.set("n", "<leader>q", "<C-v>", { desc = "enter visual block mode" })
keymap.set("v", ">", ">gv", { desc = "indent right" })
keymap.set("v", "<", "<gv", { desc = "indent left" })
keymap.set("v", "K", ":m -2<CR>V", { desc = "move single line up" })
keymap.set("v", "J", ":m +1<CR>V", { desc = "move single line down" })
keymap.set("n", "<leader>uni", ":UnicodeSearch!", { desc = "insert [uni]code symbol" })

-- plugin key mappings
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "show [m]arkdown [p]review" })
keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "[m]arkdown preview [s]top" })
keymap.set("n", "<leader>??", ":lua require('which-key').show({ global = true })<CR>", { desc = "show global keymaps (which-key)" })
keymap.set("n", "<leader>?", ":lua require('which-key').show({ global = false })<CR>", { desc = "show buffer local keymaps (which-key)" })
