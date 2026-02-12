return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            quickfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
███████╗███████╗ █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔════╝██╔════╝██╔══██╗████╗  ██║██║   ██║██║████╗ ████║
███████╗█████╗  ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║
╚════██║██╔══╝  ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
                  Sponsored by Aaron]]
                },
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "recent_files", limit = 5, padding = 1 },
                    { section = "projects", limit = 5, padding = 1 },
                    { section = "startup" },
                },
            },
        },
        keys = {
            { "<leader>lg", function() require("snacks").lazygit() end, desc = "Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },

            -- Snacks Picker
            { "<leader>sf", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)" },
            { "<leader>sc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
            { "<leader>ss", function() require("snacks").picker.grep() end, desc = "Grep word" },
            { "<leader>sws", function() require("snacks").picker.grep_word() end, desc = "Search Visual selection or Word", mode = { "n", "x" } },
            { "<leader>sk", function() require("snacks").picker.keymaps({ layout = "ivy" }) end, desc = "Search Keymaps (Snacks Picker)" },
            { "<leader>sgb", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick and Switch Git Branches" },
            { "<leader>sh", function() require("snacks").picker.help() end, desc = "Help Pages" },
        },
    },
}
