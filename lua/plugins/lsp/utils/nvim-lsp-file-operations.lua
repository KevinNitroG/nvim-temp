---@type NvPluginSpec
return {
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
  cond = vim.g.use_lsp_file_operation,
  config = true,
}
