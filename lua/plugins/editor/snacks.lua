return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = {
    -- Notifications
    notifier = {
      enabled = true,
      timeout = 3000,
    },

    -- vim.ui.input / vim.ui.select
    picker = {
      enabled = true,
      win = {
        input = {
          border = "rounded",
          wo = {
            winblend = 8,
          },
        },
        list = {
          wo = {
            winblend = 8,
          },
        },
        preview = {
          wo = {
            winblend = 8,
          },
        },
      },
    },

    -- Indent guides
    indent = {
      enabled = false,
      -- only_scope = true,
      -- symbol = "▏",
      -- symbol = "▏",
      -- symbol = "▏",
      -- symbol = "⁑",
      -- symbol = "⡇",
      -- symbol = "⟅",
    },

    -- Modules we don't currently use
    bigfile = {
      enabled = false,
    },

    explorer = {
      enabled = false,
    },

    input = {
      enabled = true,
    },

    dashboard = {
      enabled = true,
    },
  },
}
