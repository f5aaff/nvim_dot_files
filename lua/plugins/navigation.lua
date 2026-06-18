return {

	{ "theprimeagen/harpoon", branch = "harpoon2" },

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>ri",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
			},
		},
		config = function()
			require("refactoring").setup({})
		end,
	},

-- not as good as neotree!
--	{
--		"nvim-tree/nvim-tree.lua",
--		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
--		dependencies = { "nvim-tree/nvim-web-devicons" },
--
--		config = function()
--			require("nvim-tree").setup()
--			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
--		end,
--	},

}
