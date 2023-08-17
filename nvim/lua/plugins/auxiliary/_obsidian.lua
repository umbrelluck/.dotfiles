return {
    "epwalsh/obsidian.nvim",
    event = "BufReadPre */obsidian/*.md",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        dir = "~/obsidian/Vaultum/",
        daily_notes = {
            folder = "daily",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
            -- "current_dir", "notes_subdir"
            new_notes_location = "current_dir",
            prepend_note_id = false
        },
        -- Accepted values are "current", "hsplit" and "vsplit"
        open_notes_in = "current"
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        _G.nmap("gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })

        -- _G.nmap("<leader>oo", ":ObsidianOpen ", { silent = false, desc = "[Obsidian]: [o]pen file in Obsidian" })
        -- _G.nmap("<leader>on", ":ObsidianNew ", { silent = false, desc = "[O]bsidian: create new [n]ote" })
        -- _G.nmap("<leader>ow", ":ObsidianQuickSwitch ", { silent = false, desc = "[Obsidian]: quick s[w]itch note" })
        -- _G.nmap("<leader>of", ":ObsidianFollowLink ", { silent = false, desc = "[Obsidian]: [f]ollow link" })
    end
}
