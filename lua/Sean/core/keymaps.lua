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
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   -- Open new
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- Close current
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     -- Go to next
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     -- Go to previous
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>") -- Open current tab in new tab

vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", ";", ":")
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

-- Copy filepath to the clipboard
vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath)          -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- LSP functions
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    -- vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
    vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to Definition' })
    vim.keymap.set('n', '<leader>ck', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
    vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to Implementation' })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature Help' })
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = 'Add Workspace Folder' })
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { buffer = bufnr, desc = 'Remove Workspace Folder' })
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, { buffer = bufnr, desc = 'List Workspace Folders' })
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Go to Type Definition' })
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Go to References' })
    vim.keymap.set('n', '<leader><leader>f', function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = 'Format Buffer' })
  end
})
