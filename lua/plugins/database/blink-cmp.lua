return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      per_filetype = {
        sql = { "lsp", "dadbod", "snippets", "buffer" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
  },
}
