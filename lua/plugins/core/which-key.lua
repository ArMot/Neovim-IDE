return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    opts = {
      preset = "modern",
      delay = 200,
      expand = 1,
      notify = false,
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },

      win = {
        border = "rounded",
        padding = { 1, 2 },
        title = true,
        title_pos = "center",
        wo = {
          winblend = 0,
        },
      },

      layout = {
        width = {
          min = 22,
          max = 50,
        },
        spacing = 4,
      },

      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },

      sort = {
        "group",
        "alphanum",
        "order",
      },

      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>c", group = "Code" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>u", group = "UI" },
        { "<leader>t", group = "Terminal" },
        { "<leader>b", group = "Buffers" },
        { "<leader>s", group = "Search" },
        { "<leader>q", group = "Session" },
        { "<leader>r", group = "Rename / Refactor" },
        { "<leader>a", group = "AI" },
      },
    },
  },
}
