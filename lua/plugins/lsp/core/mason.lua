---@type NvPluginSpec
return {
  "iguanacucumber/mason.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  keys = {
    {
      "<leader>lm",
      "<CMD>Mason<CR>",
      desc = "Mason | Toggle",
      silent = true,
    },
  },
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonInstallAll",
    "MasonUpdate",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonLog",
  },
  opts = {
    ui = {
      border = vim.g.border_enabled and "rounded" or "none",
      check_outdated_packages_on_open = false,
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
    registries = {
      "github:nvim-java/mason-registry",
      "github:mason-org/mason-registry",
    },
  },
}
