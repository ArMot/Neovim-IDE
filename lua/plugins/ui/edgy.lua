return {
  "folke/edgy.nvim",

  event = "VeryLazy",

  opts = {
    animate = {
      enabled = false,
    },

    left = {
      {
        ft = "neo-tree",
        title = "Explorer",
        size = { width = 35 },
        pinned = true,
      },
    },

    bottom = {
      {
        ft = "trouble",
        title = "Problems",
        size = { height = 35 },
      },
      {
        ft = "toggleterm",
        title = "Terminal",
        size = { height = 35 },
      },
      {
        ft = "qf",
        title = "QuickFix",
      },
    },

    right = {
      {
        ft = "aerial",
        title = "Symbols",
        size = { height = 4 },
        pinned = true,
      },
      {
        ft = { "Avante", "AvanteInput", "AvanteSelectedFiles", "AvanteDiff" },
        title = "AI Assistant",
        size = { width = 45 },
        pinned = true,
      },
    },
  },
}
