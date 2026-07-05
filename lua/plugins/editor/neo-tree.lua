return {
  {
    "nvim-neo-tree/neo-tree.nvim",

    opts = function(_, opts)
      ------------------------------------------------------------------
      -- General
      ------------------------------------------------------------------

      opts.close_if_last_window = true
      opts.popup_border_style = "rounded"
      opts.auto_clean_after_session_restore = true

      ------------------------------------------------------------------
      -- Source Selector (Astro Style)
      ------------------------------------------------------------------

      opts.source_selector = vim.tbl_deep_extend("force", opts.source_selector or {}, {
        winbar = true,
        statusline = false,
        content_layout = "center",
        tabs_layout = "equal",

        sources = {
          { source = "filesystem", display_name = "󰙅 Files" },
          { source = "buffers", display_name = "󰈚 Buffers" },
          { source = "git_status", display_name = " Git" },
        },
      })

      ------------------------------------------------------------------
      -- Filesystem
      ------------------------------------------------------------------

      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },

        group_empty_dirs = true,

        filtered_items = {
          hide_dotfiles = false,
        },
      })

      ------------------------------------------------------------------
      -- Better Icons
      ------------------------------------------------------------------

      opts.default_component_configs = opts.default_component_configs or {}

      opts.default_component_configs.modified =
        vim.tbl_deep_extend("force", opts.default_component_configs.modified or {}, {
          symbol = "󰐖",
        })

      opts.default_component_configs.git_status =
        vim.tbl_deep_extend("force", opts.default_component_configs.git_status or {}, {
          symbols = {
            staged = "",
          },
        })

      ------------------------------------------------------------------
      -- Better Navigation
      ------------------------------------------------------------------

      opts.commands = opts.commands or {}

      opts.commands.parent_or_close = function(state)
        local node = state.tree:get_node()

        if node:has_children() and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end

      opts.commands.child_or_open = function(state)
        local node = state.tree:get_node()

        if node:has_children() then
          if not node:is_expanded() then
            state.commands.toggle_node(state)
          elseif node.type == "directory" then
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          else
            state.commands.open(state)
          end
        else
          state.commands.open(state)
        end
      end

      ------------------------------------------------------------------
      -- Copy Selector (Astro Style)
      ------------------------------------------------------------------

      opts.commands.copy_selector = function(state)
        local node = state.tree:get_node()

        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ["PATH"] = filepath,
          ["PATH (cwd)"] = modify(filepath, ":."),
          ["PATH (home)"] = modify(filepath, ":~"),
          ["FILENAME"] = filename,
          ["BASENAME"] = modify(filename, ":r"),
          ["EXTENSION"] = modify(filename, ":e"),
          ["URI"] = vim.uri_from_fname(filepath),
        }

        local options = vim.tbl_keys(vals)

        table.sort(options)

        vim.ui.select(options, {
          prompt = "Copy:",
          format_item = function(item)
            return ("%s → %s"):format(item, vals[item])
          end,
        }, function(choice)
          if choice then
            vim.fn.setreg("+", vals[choice])
          end
        end)
      end

      ------------------------------------------------------------------
      -- Window
      ------------------------------------------------------------------

      opts.window = opts.window or {}
      opts.window.width = 32
      opts.window.mappings = vim.tbl_extend("force", opts.window.mappings or {}, {
        h = "parent_or_close",
        l = "child_or_open",
        Y = "copy_selector",
        ["<S-CR>"] = "system_open",
      })

      ------------------------------------------------------------------
      -- System Open
      ------------------------------------------------------------------

      opts.commands.system_open = function(state)
        vim.ui.open(state.tree:get_node():get_id())
      end

      ------------------------------------------------------------------
      -- Better Neo-tree buffer
      ------------------------------------------------------------------

      opts.event_handlers = opts.event_handlers or {}

      table.insert(opts.event_handlers, {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.opt_local.signcolumn = "auto"
          vim.opt_local.foldcolumn = "0"
        end,
      })

      return opts
    end,
  },
}
