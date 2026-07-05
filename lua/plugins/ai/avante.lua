local AI = require("config.ai")

return {
  "yetone/avante.nvim",

  event = "VeryLazy",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- "nvim-telescope/telescope.nvim",
    -- "nvim-tree/nvim-web-devicons",
    "HakonHarnes/img-clip.nvim",
    "stevearc/dressing.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },

  opts = {
    debug = true,
    mode = "legacy",
    ----------------------------------------------------------
    -- Provider
    ----------------------------------------------------------
    -- provider = "openai",
    -- providers = {
    --   openai = {
    --     disable_tools = true,
    --     endpoint = AI.chat_endpoint(),
    --     api_key_name = AI.chat_api_key_name(),
    --     model = AI.chat_model(),
    --     timeout = AI.generation.chat.timeout,
    --     extra_request_body = {
    --       temperature = AI.generation.chat.temperature,
    --       max_tokens = AI.generation.chat.max_tokens,
    --     },
    --   },
    -- },

    ----------------------------------------------------------
    -- Behaviour
    ----------------------------------------------------------

    behaviour = {
      auto_suggestions = false,
      auto_apply_diff_after_generation = false,
      enable_token_counting = false,
      enable_cursor_planning_mode = false,
    },

    ----------------------------------------------------------
    -- UI
    ----------------------------------------------------------

    ui = {
      width = 45,
      input_height = 8,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },

    ----------------------------------------------------------
    -- Windows (Edgy friendly)
    ----------------------------------------------------------

    windows = {
      sidebar = {
        -- position = "right",
        width = 45,
        winblend = 0,
      },

      input = {
        height = 10,
        border = "rounded",
        winblend = 8,
      },
    },

    ----------------------------------------------------------
    -- Markdown rendering (IMPORTANT for UX)
    ----------------------------------------------------------

    render_markdown = {
      enabled = true,
      file_types = { "markdown", "Avante" },
    },

    ----------------------------------------------------------
    -- Keymaps
    ----------------------------------------------------------

    -- mappings = {
    --   ask = "<leader>aa",
    --   edit = "<leader>ae",
    --   refresh = "<leader>ar",
    --   focus = "<leader>af",
    --   toggle = "<leader>at",
    -- },

    ----------------------------------------------------------
    -- Hints / UX polish
    ----------------------------------------------------------

    hints = {
      enabled = true,
    },
  },

  config = function(_, opts)
    require("avante").setup(opts)
  end,
}
