# Plugin recommendations

Researched on 2026-10-19 using the linked official repositories and their
READMEs. Recommendations reflect the plugins actually loaded by this config,
including Gitsigns in `lua/plugins/gitsigns.lua`, and its use of Neovim 0.12,
`vim.pack`, native completion, and the `main` branch of `nvim-treesitter`.
These are recommendations, not an installation or runtime compatibility test.

| Name | What it does | Why it would be a useful addition |
| --- | --- | --- |
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Browsable lists for diagnostics, references, symbols, quickfix entries, and Telescope results. | Your existing diagnostic mappings open location lists or jump between problems. Trouble adds a project-wide pane for reviewing errors from your LSP servers and external linters. |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | Adds, changes, and deletes surrounding quotes, brackets, tags, and other pairs. | Adds editing operations missing from your config. Its normal-mode `ys`, `cs`, and `ds` mappings complement Leap's `s` and `S` motions. |
| [mini.pairs](https://github.com/nvim-mini/mini.pairs) (adopted) | Inserts matching brackets and quotes and handles paired deletion and newlines. | Now loaded on first insert. It works with native completion, so no separate autopairs plugin is needed. |
| [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) | Syntax-aware selection, navigation, and swapping of functions, parameters, and other constructs. | Builds on your existing parsers to support operations such as selecting a function body or swapping arguments. Use its `main` branch to match your Tree-sitter setup, and configure the mappings you want. Available objects depend on language queries. |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim) | Multi-file Git diffs, file history, and a merge-conflict interface. | Gitsigns already covers inline changes; Diffview adds a dedicated view for reviewing an entire change set. Its last repository push was in August 2024 when checked, so verify behavior on Neovim 0.12 before adopting it. |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights and searches markers such as `TODO`, `FIX`, and `HACK`, with Telescope and Trouble integration. | Lets you find unfinished work across a project through Telescope, which you already use, rather than searching each marker separately. |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | A code outline and symbol navigation using LSP, Tree-sitter, or other backends. | Useful for navigating long C#, Rust, Python, and Lua files. You can prioritize its LSP backend to reuse your configured servers where they support document symbols. It overlaps with Trouble's symbols view, so consider whether you need both. |
| [persistence.nvim](https://github.com/folke/persistence.nvim) | Automatically saves editing sessions and provides commands/API calls to restore them. | Your config has buffer navigation but no session setup. Restoring a project's buffers and window layout would reduce setup when returning to work. Session restoration must be triggered or wired into your workflow. |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debugging with breakpoints, stepping, launch/attach support, and variable inspection. | Adds debugging, which your LSP configuration does not provide. Requires separate language adapters, such as `netcoredbg` for C#, `debugpy` for Python, or CodeLLDB for Rust, plus launch configurations. |
| [neotest](https://github.com/nvim-neotest/neotest) | Runs tests from the editor and displays results, output, and a test summary. | Useful for running the test nearest your cursor without leaving Neovim. Requires language-specific adapters and dependencies, including `nvim-nio`. Check each adapter's Tree-sitter requirements; your configured parser list currently omits Python. |

## Where to start

Start with **trouble.nvim** and **nvim-surround**; automatic pairing is already
provided by mini.pairs. These add a diagnostic overview and editing operations
without replacing your picker, file explorers, motion plugin, or completion stack.
Treat **nvim-dap** and **neotest** as separate setup tasks because their usefulness
depends on language adapters and project configuration.

## Sources and limitations

Each plugin name links to its official repository, whose README documents the
features and requirements summarized above. GitHub repository metadata was also
checked through `gh api repos/<owner>/<repo>` for popularity and archived status;
none of these repositories was archived at the time of research.

Existing capabilities were checked against `init.lua`, `lua/config/keymap.lua`,
and the plugin modules, rather than assuming every entry in
`nvim-pack-lock.json` is loaded. No plugins were installed or configured.
