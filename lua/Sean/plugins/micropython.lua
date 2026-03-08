return {
    "jim-at-jibba/micropython.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
        local micropython = require("micropython_nvim")
        micropython.setup()
    vim.keymap.set("n", "<leader>mr", micropython.run)
end
}
