local open_spell_sugestion = function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  if col <= #line and line:sub(col, col):match("%a") then
    vim.cmd("Telescope spell_suggest")
  end
end

---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    { "<C-Space>", open_spell_sugestion, desc = "Find | Spell Suggest", silent = true },
    { "<M-;>", open_spell_sugestion, desc = "Find | Spell Suggest", silent = true },
  },
  opts = {
    extensions_list = {
      "fzf",
    },
    defaults = {
      path_display = { "smart" },
      file_ignore_patterns = { "node_modules", "\\.git/", "\\.git\\" },
    },
  },
}
