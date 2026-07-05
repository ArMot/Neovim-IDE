return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    ----------------------------------------------------------
    -- KEYMAP
    ----------------------------------------------------------
    opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
      preset = "default",
      ["<Tab>"] = {
        "select_next",
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        "select_prev",
        "snippet_backward",
        "fallback",
      },
      ["<CR>"] = {
        "accept",
        "fallback",
      },
    })

    ----------------------------------------------------------
    -- COMPLETION
    ----------------------------------------------------------
    opts.completion = opts.completion or {}
    opts.completion.accept = {
      auto_brackets = {
        enabled = true,
      },
    }
    opts.completion.ghost_text = {
      enabled = true,
    }
    opts.completion.menu = {
      border = "rounded",
      winblend = 6,
    }
    opts.completion.menu = opts.completion.menu or {}
    opts.completion.menu.auto_show = true
    opts.completion.trigger = opts.completion.trigger or {}
    opts.completion.trigger.prefetch_on_insert = false

    return opts
  end,
}
