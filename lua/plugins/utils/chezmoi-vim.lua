---@type NvPluginSpec
return {
  "alker0/chezmoi.vim",
  enabled = vim.fn.executable("chezmoi") == 1,
  lazy = false,
  init = function()
    -- This option is required.
    vim.g["chezmoi#use_tmp_buffer"] = true
  end,
}
