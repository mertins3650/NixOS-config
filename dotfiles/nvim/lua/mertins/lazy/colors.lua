function ColorMyPencils(color)
	color = color or "catppuccin-frappe"
	--color = color or "gruvbuddy"
	vim.cmd.colorscheme(color)
end

return {
	{
		"tjdevries/colorbuddy.nvim",
		name = "colorbuddy",
		lazy = false,
		priority = 1000,
		config = function()
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
				flavour = "frappe",
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
