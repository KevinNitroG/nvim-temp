return {
  "neovim/nvim-lspconfig",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local servers = { "html", "cssls" }
    vim.lsp.enable(servers)
  end,
}
