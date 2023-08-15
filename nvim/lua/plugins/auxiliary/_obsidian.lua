return {
    "epwalsh/obsidian.nvim",
    event = { "BufReadPre ~/obsidian/**/**.md" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        dir = "~/obsidian/Vaultище/",
        daily_notes = {
            folder = "Daily Notes",
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
        _G.map("gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })
    end
}
