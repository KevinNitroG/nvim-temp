---@type NvPluginSpec
return {
  "fedepujol/move.nvim",
  cmd = {
    "MoveBlock",
    "MoveHBlock",
    "MoveWord",
    "MoveLine",
  },
  keys = {
    { "<A-j>", "<cmd>MoveLine(1)<CR>", desc = "Move | Line Down", noremap = true, silent = true },
    { "<A-k>", "<cmd>MoveLine(-1)<CR>", desc = "Move | Line Up", noremap = true, silent = true },
    { "<A-l>", "<cmd>MoveWord(1)<CR>", desc = "Move | Word Right", noremap = true, silent = true },
    { "<A-h>", "<cmd>MoveWord(-1)<CR>", desc = "Move | Word Left", noremap = true, silent = true },
    -- Visual-mode commands
    { "<A-j>", "<cmd>MoveBlock(1)<CR>", desc = "Move | Block Down", noremap = true, silent = true },
    { "<A-k>", "<cmd>MoveBlock(-1)<CR>", desc = "Move | Block Up", noremap = true, silent = true },
    { "<A-h>", "<cmd>MoveHBlock(-1)<CR>", desc = "Move | Block Left", noremap = true, silent = true },
    { "<A-l>", "<cmd>MoveHBlock(1)<CR>", desc = "Move | Block Right", noremap = true, silent = true },
  },
  config = true,
}
