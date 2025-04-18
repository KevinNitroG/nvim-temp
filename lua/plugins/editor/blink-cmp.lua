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
    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = "luasnip" },
      appearance = { nerd_font_variant = "normal" },
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "select_and_accept", "fallback" },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = "rounded",
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
      signature = { enabled = false },
    },
  },
}
