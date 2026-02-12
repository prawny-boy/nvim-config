local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Indent multiple lines that are selected
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts) 

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "Cursor" })
  end,
})

-- Tab stuff
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- Open new
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- Close current
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- Go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- Go to previous
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") -- Open current tab in new tab

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })
