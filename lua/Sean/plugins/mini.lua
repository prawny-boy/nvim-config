return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.comment").setup()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.statusline").setup({ use_icons = true, set_vim_settings = true })
      require("mini.surround").setup()

      require("mini.files").setup({
        windows = {
          width_preview = 50,
        },
        options = {
          permanent_delete = false,
        },
      })

      local mini_files = require("mini.files")
      vim.keymap.set("n", "<leader>ex", function()
        local current = vim.api.nvim_buf_get_name(0)
        if current == "" then
          current = vim.fn.getcwd()
        end

        if mini_files.close() then
          return
        end

        mini_files.open(current, true)
      end, { desc = "Toggle Mini Files" })

      vim.keymap.set("n", "<leader>ef", function()
        mini_files.open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = "Reveal current file in Mini Files" })
    end,
  },
}
