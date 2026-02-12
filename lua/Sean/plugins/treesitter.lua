return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            automatic_installation = true,
            ensure_installed = {
                "lua",
                "python",
                "java",
            }
        })
    end,
}
