return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true,
                save_on_change = true,
            },

            default = {
                get_root_dir = function()
                    return vim.loop.cwd()
                end,

                encode = function(item)
                    return vim.fn.fnamemodify(item.value, ":.")
                end,

                decode = function(rel_path)
                    return vim.loop.cwd() .. "/" .. rel_path
                end,
            },
        })

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon add file" })

        vim.keymap.set("n", "<C-a>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon toggle menu" })
    end,
}
