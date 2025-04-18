---@type NvPluginSpec

if vim.fn.executable("chezmoi") == 1 then
  return {}
end

return {
  {

    "xvzc/chezmoi.nvim",
    init = function()
      local exclude_patterns = {
        [[.*chezmoi.*chezmoi.*]],
      }

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = {
          (vim.fn.expand("~")):gsub("\\", "/") .. "/.local/share/chezmoi/home/*",
        },
        callback = function(args)
          local bufnr = args.buf
          local file_path = vim.fn.expand("%:p", bufnr)
          for _, pattern in ipairs(exclude_patterns) do
            if file_path:match(pattern) then
              return
            end
          end
          local edit_watch = function()
            require("chezmoi.commands.__edit").watch(bufnr)
          end
          vim.schedule(edit_watch)
        end,
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      edit = {
        watch = true,
      },
    },
  },
  {

    "alker0/chezmoi.vim",
    lazy = false,
    init = function()
      -- This option is required.
      vim.g["chezmoi#use_tmp_buffer"] = true
    end,
  },
}
