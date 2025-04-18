local open_spell_sugestion = function()
  local col = vim.fn.col "."
  local line = vim.fn.getline "."
  if col <= #line and line:sub(col, col):match "%a" then
    vim.cmd "Telescope spell_suggest"
  end
end


---@type NvPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  keys = {
    {
      "<leader>fa",
      "<cmd>Telescope autocommands<cr>",
      desc = "Telescope | Autocommands",
      silent = true,
    },
    {
      "<leader>fc",
      "<cmd>Telescope git_commits<cr>",
      desc = "Telescope | Commits",
      silent = true,
    },
    -- {
    --   "<leader>ff",
    --   "<cmd>Telescope find_files<cr>",
    --   desc = "Telescope | Files",
    --   silent = true,
    -- },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files {
          find_command = {
            "fd",
            "--type",
            "file",
            "--color",
            "never",
            "--hidden",
            "--follow",
            "--no-ignore",
            "--ignore-file=" .. fdignore,
          },
        }
      end,
      desc = "Telescope | Find Files",
      silent = true,
    },
    {
      "<leader>fs",
      "<cmd>Telescope persisted<cr>",
      desc = "Telescope | Sessions",
      silent = true,
    },
    {
      "<leader>fm",
      "<cmd>Telescope marks<cr>",
      desc = "Telescope | Marks",
      silent = true,
    },
    {
      "<leader>fM",
      "<cmd>Telescope man_pages<cr>",
      desc = "Telescope | Man Pages",
      silent = true,
    },
    {
      "<leader>fw",
      "<cmd>Telescope live_grep<cr>",
      desc = "Telescope | Word",
      silent = true,
    },
    {
      "<leader>fb",
      "<cmd>Telescope buffers<cr>",
      desc = "Telescope | Buffers",
      silent = true,
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "Telescope | Notify History",
      silent = true,
    },
    {
      "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Telescope | Help",
      silent = true,
    },
    {
      "<leader>fk",
      "<cmd>Telescope keymaps<cr>",
      desc = "Telescope | Keymaps",
      silent = true,
    },
    {
      "<leader>fC",
      "<cmd>Telescope commands<cr>",
      desc = "Telescope | Commands",
      silent = true,
    },
    {
      "<leader>fr",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Telescope | Recent Files",
      silent = true,
    },
    {
      "<leader>fs",
      "<cmd>Telescope grep_string<cr>",
      desc = "Telescope | Grep String",
      silent = true,
    },
    {
      "<leader>fs",
      function()
        local text = require("core.utils").get_visual_selection()
        require("telescope.builtin").current_buffer_fuzzy_find { default_text = text }
      end,
      mode = "v",
      desc = "Telescope | Grep String Under Cursor",
      silent = true,
    },
    {
      "<leader>fH",
      "<cmd>Telescope highlights<cr>",
      desc = "Telescope | Highlights",
      silent = true,
    },
    {
      "<leader>ls",
      "<cmd>Telescope lsp_document_symbols<cr>",
      desc = "Telescope | Buffer Symbols",
      silent = true,
    },
    {
      "<leader>lS",
      "<cmd>Telescope lsp_workspace_symbols<cr>",
      desc = "Telescope | Workspace Symbols",
      silent = true,
    },
    {
      "<leader>gb",
      "<cmd>Telescope git_branches<cr>",
      desc = "Telescope | Checkout branch",
      silent = true,
    },
    {
      "<leader>gc",
      "<cmd>Telescope git_commits<cr>",
      desc = "Telescope | Checkout commit",
      silent = true,
    },
    {
      "<C-Space>",
      open_spell_sugestion,
      desc = "Telescope | Open Spell Suggestion",
      silent = true,
    },
    {
      "<M-;>", -- For windows terminal bruh
      open_spell_sugestion,
      desc = "Telescope | Open Spell Suggestion",
      silent = true,
    }
  },
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    pickers = {
      oldfiles = {
        prompt_title = "Recent Files",
      },
      find_files = {
        hidden = true,
        follow = true,
      },
      live_grep = {
        additional_args = {
          "--hidden",
          "--multiline",
        },
      },
      grep_string = {
        additional_args = {
          "--hidden",
          "--multiline",
        },
      },
    },
    extensions_list = { 
      -- "themes", 
      -- "terms",
      "fzf",
      -- "projects"
    },
    defaults = {
      path_display = { "smart" },
      -- mappings = {
      --   i = {
      --     ["<Tab>"] = require("telescope.actions").move_selection_next,
      --     ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
      --     ["<C-n>"] = require("telescope.actions").move_selection_worse,
      --     ["<C-p>"] = require("telescope.actions").move_selection_better,
      --   },
      -- },
      file_ignore_patterns = { "node_modules", "\\.git/", "\\.git\\" },
    },
  },
}
