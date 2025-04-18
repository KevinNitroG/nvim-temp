-- FIXME: Hey seem this doesn't work
---@type NvPluginSpec
return {
  "max397574/better-escape.nvim",
  name = "better_escape",
  event = "VeryLazy",
  opts = {
    default_mappings = false,
    mappings = {
      i = {
        j = {
          k = "<Esc>",
        },
      },
    },
  },
  config = function(_, opts)
    require("better_escape").setup(opts)
  end,
}
