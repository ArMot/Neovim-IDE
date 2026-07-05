return {
  --------------------------------------------------------------------------
  -- Global Floating Windows
  --------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, {
        lsp_doc_border = true,
      })

      opts.cmdline = vim.tbl_deep_extend("force", opts.cmdline or {}, {
        view = "cmdline_popup",
      })

      opts.popupmenu = vim.tbl_deep_extend("force", opts.popupmenu or {}, {
        backend = "blink",
      })

      return opts
    end,
  },

  --------------------------------------------------------------------------
  -- LSP
  --------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",

    opts = function()
      local border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = border,
      })

      vim.diagnostic.config({
        float = {
          border = border,
          source = "if_many",
          header = "",
          prefix = "",
        },
      })
    end,
  },

  --------------------------------------------------------------------------
  -- Blink
  --------------------------------------------------------------------------
  {
    "Saghen/blink.cmp",

    opts = function(_, opts)
      opts.completion = opts.completion or {}

      opts.completion.documentation = vim.tbl_deep_extend("force", opts.completion.documentation or {}, {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      })

      opts.signature = vim.tbl_deep_extend("force", opts.signature or {}, {
        enabled = true,
        window = {
          border = "rounded",
        },
      })

      return opts
    end,
  },

  --------------------------------------------------------------------------
  -- Mason
  --------------------------------------------------------------------------
  {
    "mason-org/mason.nvim",

    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  --------------------------------------------------------------------------
  -- Lazy
  --------------------------------------------------------------------------
  {
    "folke/lazy.nvim",

    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
}
