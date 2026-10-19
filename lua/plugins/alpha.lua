vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/goolord/alpha-nvim",
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")

dashboard.section.header.val = {
    [[              |    |    |                 ]],
    [[             )_)  )_)  )_)                ]],
    [[            )___))___))___)\              ]],
    [[           )____)____)_____)\\            ]],
    [[         _____|____|____|____\\\__        ]],
    [[---------\                   /---------   ]],
    [[  ^^^^^ ^^^^^^^^^^^^^^^^^^^^^             ]],
    [[    ^^^^      ^^^^     ^^^    ^^          ]],
    [[         ^^^^      ^^^                    ]],
    [[                                          ]],
}

alpha.setup(dashboard.opts)
