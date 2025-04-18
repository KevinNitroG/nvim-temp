return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },

  rock = {
    hererocks = true,
  },

  ui = {
    border = vim.g.border_enabled and "rounded" or "none",
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  change_detection = {
    enabled = true,
    notify = false,
  },

  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
