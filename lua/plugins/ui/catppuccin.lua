return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = function()
    return {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = false, -- disables setting the background color.
      float = {
        transparent = true, -- enable transparent floating windows
      },
      dim_inactive = {
        enabled = true,
      },
      no_italic = false,
      no_bold = false,
    }
  end,
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
