return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- List of language servers to install automatically
        ensure_installed = { "lua_ls", "pyright", "rust_analyzer", "clangd", "jdtls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {"williamboman/mason-lspconfig.nvim"},
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(args)
        -- Buffer-local options
        local bufnr = args.buf
        -- Set keymaps for common LSP functions
        vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
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
          vim.lsp.buf.format { async = true }
        end, { buffer = bufnr, desc = 'Format Buffer' })
      end,
    })
    end,
  },
}
