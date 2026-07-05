return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",

    ---@type Flash.Config
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",

      search = {
        enabled = true,
        multi_window = true,
      },

      jump = {
        autojump = false,
        nohlsearch = true,
      },

      label = {
        uppercase = false,
        rainbow = {
          enabled = true,
        },
      },

      highlight = {
        backdrop = true,
        groups = {
          match = "FlashMatch",
          current = "FlashCurrent",
          backdrop = "FlashBackdrop",
          label = "FlashLabel",
        },
      },

      modes = {
        search = {
          enabled = true,
        },

        char = {
          enabled = true,

          jump_labels = true,

          multi_line = true,
        },
      },
    },

    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },

      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },

      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },

      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },

      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
