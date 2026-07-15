return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      local parser_configs = {
        "lua",
        "python",
        "c",
        "cpp",
        "json",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
      }

      -- Install parsers automatically
      require("nvim-treesitter").install(parser_configs)

      -- Enable highlighting
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "json",
          "lua",
          "markdown",
          "python",
          "vim",
          "vimdoc",
        },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      -- Enable indentation
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "json",
          "lua",
          "markdown",
          "python",
          "vim",
          "vimdoc",
        },
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
