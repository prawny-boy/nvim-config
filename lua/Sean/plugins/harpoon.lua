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
                display = function(list_item)
                    local path = list_item.value
                    if not path then return "" end
                    -- Show last 3 path components
                    local parts = {}
                    for part in path:gmatch("[^\\/]+") do
                        table.insert(parts, part)
                    end
                    local start = math.max(1, #parts - 2)
                    return table.concat(parts, "/", start)
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
