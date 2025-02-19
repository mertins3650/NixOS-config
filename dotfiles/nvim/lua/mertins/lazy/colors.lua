function ColorMyPencils(color)
  --color = color or "catppuccin-mocha"
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)
end

return {
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
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        transparent_background = true,
        styles = {
          italic = false,
          transparency = true,
        },
      })
      ColorMyPencils()
    end,
  },
}
