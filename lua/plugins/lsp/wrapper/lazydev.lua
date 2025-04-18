---@type NvPluginSpec
return {
  "folke/lazydev.nvim",
  enabled = vim.fn.executable "lua-language-server" == 1,
  ft = "lua",
  dependencies = {
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  },
  opts = {
    library = {
      "lazy.nvim",
      "ui/nvchad_types",
      "luvit-meta/library",
    },
  },
}
