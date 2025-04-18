local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP | " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>lw", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>lW", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>w<C-l>", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  map("n", "<leader>g<C-d>", vim.lsp.buf.type_definition, opts "Go to type definition")
  map("n", "<leader>lr", require "nvchad.lsp.renamer", opts "NvRenamer")
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
-- M.capabilities = vim.tbl_deep_extend(require("nvchad.configs.lspconfig"))

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()

  vim.lsp.config("*", { capabilities = M.capabilities, on_init = M.on_init, on_attach = M.on_attach })
end

return M
