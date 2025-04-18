local M = {}
local map = vim.keymap.set

M._keymaps = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gI", vim.lsp.buf.implementation, opts("Go to definition"))
  map("n", "g<C-d>", vim.lsp.buf.type_definition, opts("Go to type definition"))
  map("n", "<leader>lw", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>lW", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

  map("n", "<leader>w<C-l>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))
end

-- export on_attach & capabilities
M.on_attach = function(client, bufnr)
  M._keymaps(client, bufnr)

  if vim.g.use_lsp_workspace_diagnostic then
    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
  end
end

-- disable semanticTokens
M.on_init = require("nvchad.configs.lspconfig").on_init

M.capabilities = require("nvchad.configs.lspconfig").capabilities

M.defaults = function()
  require("nvchad.lsp").diagnostic_config()
  if vim.g.border_enabled then
    require("lspconfig.ui.windows").default_options.border = "rounded"
  end

  vim.lsp.config("*", {
    capabilities = M.capabilities,
    on_init = M.on_init,
    on_attach = M.on_attach,
  })
end

return M
