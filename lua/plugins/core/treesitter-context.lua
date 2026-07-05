return {
  {
    "nvim-treesitter/nvim-treesitter-context",

    opts = {
      enable = true,
      multiwindow = false,
      max_lines = 5,
      min_window_height = 20,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
      mode = "cursor",
      separator = "─",
      zindex = 20,
    },
  },
}
