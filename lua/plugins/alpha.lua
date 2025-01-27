return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
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
	end,
}
