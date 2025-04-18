---@module 'blink-cmp'

---@type NvPluginSpec
return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  build = ":Copilot auth",
  cmd = "Copilot",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
    },
    filetypes = {
      ["copilot-chat"] = false,
    },
  },
  keys = {
    {
      "<leader>at",
      "<cmd>Copilot toggle<cr>",
      desc = "Copilot | Toggle Completion",
      silent = true,
    },
    {
      "<leader>ad",
      "<cmd>Copilot disable<cr>",
      desc = "Copilot | Disable Completion",
      silent = true,
    },
    {
      "<leader>ae",
      "<cmd>Copilot enable<cr>",
      desc = "Copilot | Enable Completion",
      silent = true,
    },
    {
      "<leader>aP",
      "<cmd>Copilot panel<cr>",
      desc = "Copilot | Toggle Panel",
      silent = true,
    },
  },
  config = function(_, opts)
    require("copilot").setup(opts)
    vim.cmd("Copilot disable")
  end,
  dependencies = {
    "saghen/blink.cmp",
    ---@param opts blink.cmp.Config
    opts = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts or {}, {
        sources = {
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
              score_offset = 100,
              async = true,
            },
          },
        },
      })
      opts.sources.default = vim.list_extend(opts.sources.default or {}, { "copilot" })
    end,
  },
}
