return {
  {
    "stevearc/aerial.nvim",

    opts = {
      backends = {
        "lsp",
        "treesitter",
        "markdown",
        "asciidoc",
        "man",
      },

      layout = {
        default_direction = "prefer_right",
        min_width = 30,
      },

      attach_mode = "window",
      show_guides = true,
      guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
      },

      close_automatic_events = {},
      filter_kind = false,
      highlight_on_hover = true,
      highlight_on_jump = 300,
      autojump = false,
    },
  },
}
