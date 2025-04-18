local map = vim.keymap.set

map("i", "jk", "<ESC>", {desc = "General | Escape", silent = true })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", {desc = "General | Write", silent = true })
map("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })

map("n", "<leader>ol", function()
  vim.o.number = not vim.o.number
end, { desc = "Options | Toggle Line Number", silent = true })

map("n", "<leader>or", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Options | Toggle Relative Number", silent = true })

map("n", "<leader>os", function()
  vim.o.laststatus = vim.o.laststatus == 3 and 3 or 0
end, { desc = "Options | Toggle Statusline", silent = true })

map("n", "<leader>oS", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Options | Toggle Spell Check", silent = true })

map("n", "<leader>ot", function()
  require("base46").toggle_theme()
end, { desc = "Options | Toggle Theme", silent = true })

map("n", "<leader>oT", function()
  require("base46").toggle_transparency()
end, { desc = "Options | Toggle Transparency", silent = true })

map("n", "<leader>ow", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Options | Toggle Wrap", silent = true })

map({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "General | Go to upper window", silent = true })
map({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "General | Go to lower window", silent = true })
map({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "General | Go to left window", silent = true })
map({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "General | Go to right window", silent = true })

map("n", "<leader>w", function()
  if vim.bo.buftype == "terminal" then
    vim.cmd "Bdelete!"
    vim.cmd "silent! close"
  elseif #vim.api.nvim_list_wins() > 1 then
    vim.cmd "silent! close"
  end
end, { desc = "General | Close window", silent = true })

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "General | Add size at the top", silent = true })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "General | Add size at the bottom", silent = true })
map( "n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "General | Add size at the left", silent = true })
map( "n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "General | Add size at the right", silent = true })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "General | Go to previous buffer", silent = true })

-- Go to next buffer
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "General | Go to next buffer", silent = true })

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "General | Close Buffer", silent = true })

map("n", "<leader>C", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "General | Close Other Buffers", silent = true })

map("n", "<leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "General | Themes" })

-- map("n", "<Left>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })
-- map("n", "<Right>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })
-- map("n", "<Up>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })
-- map("n", "<Down>", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

map("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })
map("v", "<", "<gv", { desc = "General | Indent backward", silent = true })
map("v", ">", ">gv", { desc = "General | Indent forward", silent = true })
