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
keymap.set("n", "<C-B>", "0", { desc = "jump to begin of line" })
keymap.set("n", "<C-E>", "$", { desc = "jump to end of line" })
keymap.set("i", "jk", "<esc>", { desc = "escape" })
keymap.set("i", "zz", ":wq", { desc = "write and quite" })

-- plugin key mappings
keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "show [m]arkdown [p]review" })
keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "[m]arkdown preview [s]top" })
keymap.set("n", "<leader>??", ":lua require('which-key').show({ global = true })<CR>", { desc = "show global keymaps (which-key)" })
keymap.set("n", "<leader>?", ":lua require('which-key').show({ global = false })<CR>", { desc = "show buffer local keymaps (which-key)" })
keymap.set("n", "<A-.>", ":BufferNext<CR>", { desc = "Jump to next tab" })
keymap.set("n", "<A-,>", ":BufferPrevious<CR>", { desc = "Jump to previous tab" })
keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", { desc = "Jump to buffer 1" })
keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", { desc = "Jump to buffer 2" })
keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", { desc = "Jump to buffer 3" })
keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", { desc = "Jump to buffer 4" })
keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", { desc = "Jump to buffer 5" })
keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", { desc = "Jump to buffer 6" })
keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", { desc = "Jump to buffer 7" })
keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", { desc = "Jump to buffer 8" })
keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", { desc = "Jump to buffer 9" })
keymap.set("n", "<A-0>", ":BufferLast<CR>", { desc = "Jump to buffer 0" })

-- terminal configuration
keymap.set("n", "<CA-t>", ":Telescope toggleterm_manager<CR>", { desc = "open toggle [t]erminal manager" })
keymap.set("t", "<CA-t>", "<C-\\><C-n>:Telescope toggleterm_manager<CR><ESC>", { desc = "open toggle [t]erminal manager" })
keymap.set("t", "<C-w><C-w>", ":<C-\\><C-n><C-W>w", { desc = "enter normal mode and switch window" })
