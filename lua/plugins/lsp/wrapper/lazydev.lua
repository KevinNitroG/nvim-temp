---@type NvPluginSpec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  dependencies = {
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  },
  ---@class lazydev.Config
  opts = {
    library = {
      "lazy.nvim",
      "ui/nvchad_types",
      "luvit-meta/library",
    },
  },
}
