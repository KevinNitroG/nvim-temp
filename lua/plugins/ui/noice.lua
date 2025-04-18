---@type NvPluginSpec
return {
  "folke/noice.nvim",
  lazy = false,
  dependencies = {
    { "MunifTanjim/nui.nvim" },
    { "rcarriga/nvim-notify" },
  },
  opts = {
    cmdline = {
      enabled = true,
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
    lsp = {
      progress = {
        enabled = false,
        format = "lsp_progress",
        format_done = "lsp_progress_done",
        throttle = 1000 / 30, -- frequency to update lsp progress message
        view = "mini",
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = true,
        silent = true,
      },
      signature = {
        enabled = false,
        auto_open = {
          enabled = true,
        },
      },
      message = {
        enabled = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = vim.g.border_enabled and "rounded" or "none",
    },
  },
  keys = {
    { "<leader>ud", "<cmd>NoiceDismiss<cr>", desc = "Noice | Dismiss", silent = true },
    { "<leader>un", "<cmd>NoiceAll<cr>", desc = "Noice | All Notification", silent = true },
  },
}
