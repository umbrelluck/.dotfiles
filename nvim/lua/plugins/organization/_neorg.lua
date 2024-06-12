return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
    },
    {
        "nvim-neorg/neorg",
        -- build = ":Neorg sync-parsers",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neorg/neorg-telescope",
            "luarocks.nvim"
        },
        event = "BufReadPre *.norg",
        keys = {
            { "<Leader>no", ":Neorg<cr>",           desc = "Open Neorg" },
            { "<Leader>ne", ":Neorg<cr>",           desc = "Open Neorg" },
            { "<Leader>nt", ":Telescope neorg<cr>", desc = "Open Neorg in Telescope" },
        },
        opts = {
            load = {
                ["core.defaults"] = {},  -- Default behaviour
                ["core.integrations.telescope"] = {},
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = {      -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            vault = "~/vault",
                        },
                    },
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                        name = "[Neorg]"
                    }
                },
                ["core.export"] = {},
                ["core.export.markdown"] = {},
                -- ["core.manouevre"] = {},   -- move different elemets up and down NOTE: deprecated
                ["core.summary"] = {}, -- Creates links to all files in any workspace.
                -- ["core.ui.calendar"] = {}, -- Open interactive calendar INFO: Not untill nvim 0.10
            },
        },
        config = function(_, opts)
            require("neorg").setup(opts)

            local neorg_callbacks = require("neorg.core.callbacks")
            neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
                -- Map all the below keybinds only when the "norg" mode is active
                keybinds.map_event_to_mode("norg", {
                    n = {
                        { "<C-s>", "core.integrations.telescope.find_linkable" },
                        { "<m-l>", "core.integrations.telescope.find_linkable" },
                    },

                    i = {
                        { "<C-l>", "core.integrations.telescope.insert_link" },
                        { "<m-i>", "core.integrations.telescope.insert_link" },
                    },
                }, {
                    silent = true,
                    noremap = true,
                })
            end)
        end
    } }
