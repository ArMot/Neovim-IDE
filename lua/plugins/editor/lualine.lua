return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function(_, opts)
      --------------------------------------------------------------------------
      -- Helpers
      --------------------------------------------------------------------------

      local mode_icons = {
        n = "󰆍",
        i = "󰏫",
        v = "󰈈",
        V = "󰈈",
        ["\22"] = "󰈈",
        c = "",
        R = "󰑕",
        s = "󰒅",
        S = "󰒅",
        t = "",
      }

      local function mode()
        return mode_icons[vim.fn.mode()] or ""
      end

      local function lsp()
        local clients = vim.lsp.get_clients({ bufnr = 0 })

        for _, client in ipairs(clients) do
          if client.name ~= "copilot" then
            return "󰒋 " .. client.name
          end
        end

        return ""
      end

      --------------------------------------------------------------------------
      -- Options
      --------------------------------------------------------------------------

      -- opts.options = vim.tbl_deep_extend("force", opts.options or {}, {
      --   globalstatus = true,
      --   icons_enabled = true,
      --   theme = "catppuccin",
      -- })
      --------------------------------------------------------------------------
      -- Sections
      --------------------------------------------------------------------------
      opts.sections = {

        ----------------------------------------------------------------------
        -- LEFT
        ----------------------------------------------------------------------

        lualine_b = {

          {
            "branch",
            icon = "",
          },

          {
            "diff",
            colored = true,

            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
          },

          {
            "diagnostics",

            sources = {
              "nvim_diagnostic",
            },

            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰌵 ",
            },
          },
        },

        lualine_c = {

          {
            "filename",
            path = 0,
            symbols = {
              modified = " 󰐖",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = "[New]",
            },
          },
        },

        ----------------------------------------------------------------------
        -- RIGHT
        ----------------------------------------------------------------------

        lualine_x = {
          {
            lsp,
            color = {
              gui = "bold",
            },
          },
          {
            "filetype",
            colored = true,
            icon_only = false,
          },
        },
        lualine_y = {
          {
            "progress",
          },
        },
        lualine_z = {
          {
            "location",
          },
        },
      }

      --------------------------------------------------------------------------
      -- Inactive
      --------------------------------------------------------------------------

      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filename",
          },
        },

        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "location",
          },
        },
      }

      --------------------------------------------------------------------------
      -- Extensions
      --------------------------------------------------------------------------

      opts.extensions = {
        "neo-tree",
        "lazy",
        "mason",
        "trouble",
        "quickfix",
        "fzf",
      }

      return opts
    end,
  },
}
