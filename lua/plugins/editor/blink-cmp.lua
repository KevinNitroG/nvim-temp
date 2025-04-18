-- NOTE: https://github.com/NvChad/ui/tree/v3.0/lua/nvchad/blink

---@module 'blink.cmp'

---@type NvPluginSpec
return {
  {
    "saghen/blink.cmp",
    event = {
      "BufReadPost",
      "BufNewFile",
      "CmdlineEnter",
    },
    version = "1.*",
    ---@param opts blink.cmp.Config
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts or {}, {
        snippets = { preset = "luasnip" },
        appearance = { nerd_font_variant = "normal" },
        keymap = {
          preset = "super-tab",
          ["<CR>"] = { "select_and_accept", "fallback" },
        },
        completion = {
          menu = require("nvchad.blink").menu,
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
              border = vim.g.border_enabled and "rounded" or "none",
            },
          },
        },
        sources = {
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
          },
        },
        signature = {
          enabled = false,
        },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15, -- Tune by preference
            opts = { insert = true }, -- Insert emoji (default) or complete its name
            should_show_items = function()
              return vim.tbl_contains(
                -- Enable emoji completion only for git commits and markdown.
                -- By default, enabled for all file-types.
                { "gitcommit", "markdown" },
                vim.o.filetype
              )
            end,
          },
        },
      })

      opts.sources.default = vim.list_extend(
        type(opts.sources.default) == "table" and opts.sources.default() or {},
        { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" }
      )
    end,
    dependencies = {
      "moyiz/blink-emoji.nvim",
    },
  },
  -- { import = "nvchad.blink.lazysec" },
}
