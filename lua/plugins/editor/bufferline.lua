return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        modified_icon = "󰐖",
        mode = "buffers",
        always_show_bufferline = true,
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        indicator = {
          style = "underline",
        },

        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" },
        },

        separator_style = "slant",
        show_buffer_close_icons = true,
        show_close_icon = false,
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        enforce_regular_tabs = false,

        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            separator = true,
          },
        },

        diagnostics_indicator = function(_, _, diagnostics_dict)
          local s = ""

          for e, n in pairs(diagnostics_dict) do
            local icon = ({
              error = " ",
              warning = " ",
              info = " ",
              hint = "󰌵 ",
            })[e]

            s = s .. icon .. n .. " "
          end

          return vim.trim(s)
        end,
      },
    },
  },
}
