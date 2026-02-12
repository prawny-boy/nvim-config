return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup({
            view = {
                width = 35,
                side = "left",
            },
            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            filters = {
                dotfiles = true,
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>ex", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree" })
        vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "Find file in Nvim Tree" })
    end,
}
