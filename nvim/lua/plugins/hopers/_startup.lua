vim.g.startup_bookmarks = {
    ["N"] = "~/.dotfiles/nvim/",
    ["Z"] = "~/.zshrc",
    ["A"] = "~/.dotfiles/alacritty/alacritty.yml",
    ["D"] = "~/.dotfiles/",
    ["P"] = "~/.local/share/nvim/lazy/"
}

local user_bookmarks = vim.g.startup_bookmarks

local bookmark_texts = { "Their legends remain till now", "" }
local user_bookmark_mappings = {}

if not user_bookmarks then
    user_bookmarks = {}
    bookmark_texts = {}
end

for key, file in pairs(user_bookmarks) do
    bookmark_texts[#bookmark_texts + 1] = key .. " " .. file
end

for key, file in pairs(user_bookmarks) do
    user_bookmark_mappings[key] = "<cmd>e " .. file .. "<CR>"
end

return {
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        opts = {
            -- theme = "dashboard",
            header = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Header",
                -- margin = 5,
                content = {
                    [[  ____  ____  ___      ___  _______    _______    _______  ___      ___       ____  ____   ______   __   ___  ]],
                    [[ ("  _||_ " ||"  \    /"  ||   _  "\  /"      \  /"     "||"  |    |"  |     ("  _||_ " | /" _  "\ |/"| /  ") ]],
                    [[ |   (  ) : | \   \  //   |(. |_)  :)|:        |(: ______)||  |    ||  |     |   (  ) : |(: ( \___)(: |/   /  ]],
                    [[ (:  |  | . ) /\\  \/.    ||:     \/ |_____/   ) \/    |  |:  |    |:  |     (:  |  | . ) \/ \     |    __/   ]],
                    [[  \\ \__/ // |: \.        |(|  _  \\  //      /  // ___)_  \  |___  \  |___   \\ \__/ //  //  \ _  (// _  \   ]],
                    [[  /\\ __ //\ |.  \    /:  ||: |_)  :)|:  __   \ (:      "|( \_|:  \( \_|:  \  /\\ __ //\ (:   _) \ |: | \  \  ]],
                    [[ (__________)|___|\__/|___|(_______/ |__|  \___) \_______) \_______)\_______)(__________) \_______)(__|  \__) ]],
                    [[                                                                                                              ]],
                },
                highlight = "Statement",
                default_color = "",
                oldfiles_amount = 0,
            },
            date_time = {
                type = "text",
                title = "",
                content = function() --require("startup.functions").date_time()
                    local clock = " " .. os.date("%H:%M")
                    local date = " " .. os.date("%d-%m-%y")
                    return { clock, date }
                end,
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                highlight = "TSString",
            },
            nvim_info = {
                type = "text",
                title = "",
                content = function()
                    local stats = require("lazy").stats()
                    local plugins = "Plugins installed 󰏖 " .. stats.count
                    local loaded_plugins = "Plugins loaded 󱧘 " .. stats.loaded
                    return { plugins, loaded_plugins }
                end,
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                highlight = "TSString",
            },
            chosen_ones = {
                type = "text",
                align = "center",
                fold_section = true,
                title = "Chosen Ones",
                -- margin = 5,
                content = bookmark_texts,
                highlight = "String",
            },
            ancient_ones = {
                type = "oldfiles",
                oldfiles_directory = true,
                align = "center",
                fold_section = true,
                title = "Ancient Ones",
                -- margin = 5,
                content = {},
                highlight = "String",
                default_color = "#FFFFFF",
                oldfiles_amount = 5,
            },
            forgotten_ones = {
                type = "oldfiles",
                oldfiles_directory = false,
                align = "center",
                fold_section = true,
                title = "Forgotten Ones",
                -- margin = 5,
                content = {},
                highlight = "String",
                default_color = "#FFFFFF",
                oldfiles_amount = 5,
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            options = {
                after = function()
                    require("startup").create_mappings(user_bookmark_mappings)
                    require("startup.utils").oldfiles_mappings()
                end,
                disable_statuslines = true,
                paddings = { 2, 2, 1, 3, 1, 1 },
            },
            parts = { "header", "date_time", "nvim_info", "ancient_ones", "chosen_ones", "forgotten_ones" }
        }
    }
}
