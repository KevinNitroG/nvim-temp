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
    opts = function()
      ---@type blink.cmp.Config
      local opts = {
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
          default = { "lazydev", "lsp", "path", "snippets", "buffer" },
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
      }
      return opts
    end,
  },
  -- { import = "nvchad.blink.lazysec" },
}
