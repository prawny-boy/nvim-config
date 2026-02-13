return {
    "neovim/nvim-lspconfig",
    name = "lspconfig",
    config = function()
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("clangd")
        vim.lsp.enable("rust_analyzer")
        vim.lsp.enable("jdtls")
        vim.lsp.enable("pyright")

        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

        local function quickfix()
            vim.lsp.buf.code_action({
                filter = function(a) return a.isPreferred end,
                apply = true
            })
        end

        vim.keymap.set('n', '<leader>qf', quickfix, {
            noremap = true,
            silent = true
        })
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local opts = { buffer = ev.buf }
                vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<leader>ck', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader><leader>f', function()
                end, opts)
            end,
        })
    end
}
