function ColorMyPencils(color)
	--color = color or "catppuccin-mocha"
	color = color or "vague"
	vim.cmd.colorscheme(color)
end

return {
	{
		"vague2k/vague.nvim",
		name = "vague",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				style = {
					strings = "none",
					keyword_return = "none",
				},
			})
			ColorMyPencils()
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				no_italic = false,
				styles = {
					conditionals = {},
					miscs = {},
					keywords = {},
				},
			})
			ColorMyPencils()
		end,
	},
}
