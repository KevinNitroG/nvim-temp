---@type NvPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  keys = {
    { "<leader><leader>", "<cmd>FzfLua files<CR>", desc = "FzfLua | Find Files" },
  },
}
