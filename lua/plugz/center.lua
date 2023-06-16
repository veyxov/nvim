local Center = {
	"arnamak/stay-centered.nvim",
	event = "VeryLazy",
	config = function()
		require("stay-centered")
	end,
}

local Zen = {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>c",
			function()
				require("zen-mode").toggle({
					window = {
						width = 0.5,
						backdrop = 1,
					},
				})
			end,
		},
	},
}

Zen.config = function()
	require("zen-mode").setup({
		plugins = {
			wezterm = {
				enabled = true,
				font = "+4",
			},
		},
	})
end

return {
	Center,
	Zen,
}
