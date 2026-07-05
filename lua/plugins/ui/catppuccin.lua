local theme = require("config.theme")
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      local syntax = theme.syntax_palette()
      return {

        flavour = theme.flavour,
        background = {
          light = "latte",
          dark = theme.flavour,
        },
        transparent_background = false,
        term_colors = true,
        dim_inactive = {
          enabled = true,
        },
        no_italic = false,
        no_bold = false,
        color_overrides = {},
        highlight_overrides = {
          frappe = function(colors)
            return {

              --------------------------------------------------
              -- Syntax (borrowed from Mocha)
              --------------------------------------------------

              -- SnacksIndent = {
              --   fg = syntax.surface1,
              -- },
              --
              -- SnacksIndentScope = {
              --   fg = syntax.lavender,
              -- },

              --------------------------------------------------
              -- Syntax (borrowed from Mocha)
              --------------------------------------------------
              Function = {
                fg = syntax.blue,
              },
              Identifier = {
                fg = syntax.text,
              },
              Type = {
                fg = syntax.yellow,
              },
              Keyword = {
                fg = syntax.mauve,
              },
              Statement = {
                fg = syntax.mauve,
              },
              Conditional = {
                fg = syntax.mauve,
              },
              Repeat = {
                fg = syntax.mauve,
              },
              Operator = {
                fg = syntax.sky,
              },
              Constant = {
                fg = syntax.peach,
              },
              Number = {
                fg = syntax.peach,
              },
              Boolean = {
                fg = syntax.peach,
              },
              String = {
                fg = syntax.green,
              },
              Character = {
                fg = syntax.green,
              },
              --------------------------------------------------
              -- Dashboard
              --------------------------------------------------
              DashboardHeader = {
                fg = colors.blue,
                bold = true,
              },
              DashboardCenter = {
                fg = colors.text,
              },
              DashboardFooter = {
                fg = colors.overlay1,
              },
            }
          end,
        },

        integrations = {
          blink_cmp = true,
          snacks = {
            enabled = true,
          },
          neotree = true,
          aerial = true,
          mason = true,
          notify = true,
          gitsigns = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          mini = {
            enabled = true,
            indentscope_color = "lavendar",
          },
        },
      }
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme(theme.name)
    end,
  },
}
