return {
    "thePrimeagen/harpoon",
    enabled = true,
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            global_settings = {
                save_on_toggle = true,
                save_on_change = true,
            },
        })

        -- Harpoon Nav Interface
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
        vim.keymap.set("n", "<C-a>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Harpoon toggle menu" })
    end,
}
