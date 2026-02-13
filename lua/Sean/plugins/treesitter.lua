return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            install_dir = vim.fn.stdpath('data') .. '/site'
        })
        treesitter.install({
            "java",
            "cpp",
            "python",
            "lua",
            "tsx",
        })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { "lua", "cpp", "python", "java" },
      callback = function() vim.treesitter.start() end,
    })
end
}
