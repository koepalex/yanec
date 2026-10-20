local keymap = vim.keymap
local diag = vim.diagnostic
local lsp = vim.lsp

-- fuzzy finding using telescope
keymap.set("n", "<leader>ff", function()
  require("plugins.telescope").load()
  require("telescope.builtin").find_files()
end, { desc = "fuzzy [f]ind [f]iles"})
keymap.set("n", "<leader>lg", function()
  require("plugins.telescope").load()
  require("telescope.builtin").live_grep()
end, { desc = "fuzzy [l]ive [g]rep content in workspace files"})

-- file explorer and motions
keymap.set("n", "<leader>e", function()
  require("plugins.nvim-tree")
  require("nvim-tree.api").tree.toggle()
end, { desc = "show/hide file [e]xplorer" })
keymap.set("n", "-", ":Oil<CR>", { desc = "open parent folder as buffer" })
keymap.set("n", "s", "<Plug>(leap-forward)", { desc = "leap [s]earch forward" })
keymap.set("n", "S", "<Plug>(leap-backward)", { desc = "leap [s]earch backward" })

-- LSP key maps
keymap.set("n", "K", lsp.buf.hover, { desc = "hover documentation of symbol" })
keymap.set("n", "gd", lsp.buf.definition, { desc = "[g]oto [d]efinition of symbol" })
keymap.set("n", "gD", lsp.buf.declaration, { desc = "[g]oto [D]eclaration of symbol" })
keymap.set("n", "<leader>sh", lsp.buf.signature_help, { desc = "show [s]ignature [h]elp of symbol" })

local function show_diagnostic_float(diagnostic)
  if diagnostic then
    diag.open_float({ scope = "cursor" })
  end
end

keymap.set("n", "<leader>ne", function()
  diag.jump({ count = 1, on_jump = show_diagnostic_float })
end, { desc = "jump to [n]ext [e]rror" })
keymap.set("n", "<leader>pe", function()
  diag.jump({ count = -1, on_jump = show_diagnostic_float })
end, { desc = "jump to [p]revious [e]rror" })
keymap.set("n", "<leader>se", ":lua vim.diagnostic.setloclist({severity=vim.diagnostic.severity.ERROR})<CR>", { desc = "[s]how [e]rrors in quickfix list" })
keymap.set("n", "<leader>sw", ":lua vim.diagnostic.setloclist({severity=vim.diagnostic.severity.WARN})<CR>", { desc = "[s]how [w]arnings in quickfix list" })
keymap.set("n", "<leader>si", ":lua vim.diagnostic.setloclist({severity=vim.diagnostic.severity.INFO})<CR>", { desc = "[s]how [i]nfos in quickfix list" })

keymap.set("n", "<leader>ca", lsp.buf.code_action, { desc = "show [c]ode [a]ctions" })
keymap.set("n", "<leader>rn", lsp.buf.rename, { desc = "[r]e[n]ame symbol" })
keymap.set("n", "<leader>cf", function()
    require("conform").format({
        async = false,
        timeout_ms = 3000,
        lsp_format = "fallback",
    })
end, { desc = "[f]ormatting file" })

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
keymap.set("i", "<C-s>", "<esc>:wa<esc>i", { desc = "write all files" })
keymap.set("n", "<leader>cc", "gcc", {
  remap = true,
  desc = "Toggle comment on current line",
})
keymap.set("x", "<leader>bc", "gc", {
  remap = true,
  desc = "Toggle comments on selected lines",
})

-- plugin key mappings
keymap.set("n", "<leader>gi", "<cmd>Neogit<CR>", { desc = "show Neo[gi]t UI" })
keymap.set("n", "<leader>df", "<cmd>DiffviewOpen<CR>", { desc = "[d]iffview [f]ile history" })
keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "toggle [a]erial view" })
keymap.set("n", "<leader>st", "<cmd>TodoQuickFix<CR>", { desc = "[s]how [t]odos" })
keymap.set("n", "<leader>mp", "<cmd>Vellum<CR>", { desc = "show [m]arkdown [p]review" })
keymap.set("n", "<leader>??", ":lua require('which-key').show({ global = true })<CR>", { desc = "show global keymaps (which-key)" })
keymap.set("n", "<leader>?", ":lua require('which-key').show({ global = false })<CR>", { desc = "show buffer local keymaps (which-key)" })
keymap.set("n", "<A-.>", "<cmd>BufferLineCycleNext<CR>", { desc = "Jump to next buffer" })
keymap.set("n", "<A-,>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Jump to previous buffer" })
for index = 1, 9 do
  keymap.set("n", "<A-" .. index .. ">", function()
    require("bufferline").go_to(index, true)
  end, { desc = "Jump to buffer " .. index })
end
keymap.set("n", "<A-0>", function()
  require("bufferline").go_to(-1, true)
end, { desc = "Jump to last buffer" })
keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", { desc = "[G]it [b]lame" })
