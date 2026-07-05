return {
  "rebelot/kanagawa.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,

  opts = {
    compile = true,
    transparent = false,
    terminalColors = true,

    theme = "wave",

    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },

    overrides = function(colors)
      local ui = colors.theme.ui

      return {

        ------------------------------------------------------
        -- FLOATS (FIX BLACK BACKGROUND ISSUE)
        ------------------------------------------------------

        NormalFloat = { bg = ui.bg },
        FloatBorder = { bg = ui.bg, fg = ui.border },
        FloatTitle = { bg = ui.bg, bold = true },

        ------------------------------------------------------
        -- GENERAL WINDOWS
        ------------------------------------------------------

        WinSeparator = { fg = ui.special },
        CursorLineNr = { bold = true },

        ------------------------------------------------------
        -- SIDEBAR UNIFICATION (IMPORTANT FIX)
        ------------------------------------------------------

        NeoTreeNormal = { bg = ui.bg },
        NeoTreeNormalNC = { bg = ui.bg },

        AerialNormal = { bg = ui.bg },

        TroubleNormal = { bg = ui.bg },
        TroubleNormalNC = { bg = ui.bg },

        ------------------------------------------------------
        -- AVANTE FIX (MAIN UX ISSUE YOU SAW)
        ------------------------------------------------------

        AvanteSidebarNormal = { bg = ui.bg },
        AvanteSidebarWinSeparator = { bg = ui.bg },

        AvanteInputNormal = { bg = ui.bg },
        AvanteInputBorder = { bg = ui.bg },

        AvanteTitle = { bg = ui.bg, bold = true },

        ------------------------------------------------------
        -- MARKDOWN (AVANTE RENDER)
        ------------------------------------------------------

        RenderMarkdownNormal = { bg = ui.bg },

        ------------------------------------------------------
        -- DASHBOARD
        ------------------------------------------------------
        DashboardHeader = { fg = "#7aa89f", bold = true },
        DashboardFooter = { fg = "#9cabca" },
        DashboardCenter = { fg = "#dcd7ba" },

        Pmenu = { bg = "#1f1f28" },
        PmenuSel = { bg = "#2d4f67", fg = "#dcd7ba" },
        PmenuThumb = { bg = "#54546d" },

        CmpItemAbbr = { fg = "#dcd7ba" },
        CmpItemAbbrMatch = { fg = "#7aa89f", bold = true },
        CmpItemKind = { fg = "#957fb8" },
      }
    end,
  },

  config = function(_, opts)
    require("kanagawa").setup(opts)
  end,
}
