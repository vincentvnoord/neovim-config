return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2", -- Use the harpoon2 branch for the latest features
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
		config = function()
			require("harpoon"):setup()
		end,
		keys = { -- Example keybindings
			{
				"<C-h>",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon file",
			},
			{
				"<C-a>",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon quick menu",
			},
			-- Add mappings for files 1-5 (example)
			{
				"1",
				function()
					require("harpoon"):list():select(1)
				end,
				desc = "Harpoon to file 1",
			},
			{
				"2",
				function()
					require("harpoon"):list():select(2)
				end,
				desc = "Harpoon to file 2",
			},
			{
				"3",
				function()
					require("harpoon"):list():select(3)
				end,
				desc = "Harpoon to file 3",
			},
			{
				"4",
				function()
					require("harpoon"):list():select(4)
				end,
				desc = "Harpoon to file 4",
			},
			{
				"5",
				function()
					require("harpoon"):list():select(5)
				end,
				desc = "Harpoon to file 5",
			},
		},
	},
}
