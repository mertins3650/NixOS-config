function ColorMyPencils(color)
	-- color = color or "catppuccin-frappe"
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
end

return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				style = "moon",
				styles = {
					keywords = { italic = false },
				},
				-- on_highlights = function(highlights)
				-- 	highlights["@tag.tsx"] = { fg = "#82aaff" }
				-- end,
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
