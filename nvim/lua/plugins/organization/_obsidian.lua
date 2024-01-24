return {
    "epwalsh/obsidian.nvim",
    -- enabled = false,
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Vault/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Vault/**.md",
    },
    opts = {
        workspaces = {
            {
                name = "Courses",
                path = "~/Vault/Courses",
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
            new_notes_location = "current_dir", -- current_dir | notes_subdir

            -- Control how wiki links are completed with these (mutually exclusive) options:
            -- 1. Whether to add the note ID during completion.
            -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
            prepend_note_id = false,
            -- 2. Whether to add the note path during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
            prepend_note_path = true,
            -- 3. Whether to only use paths during completion.
            -- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
            use_path_only = false,
        },

        open_notes_in = "current", -- curent | hsplit | vsplit

        disable_frontmatter = true,
        note_frontmatter_func = function(note)
            -- This is equivalent to the default frontmatter function.
            local out = { id = note.id, aliases = note.aliases, tags = note.tags }
            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end
            return out
        end,
    },
    config = function(_, opts)
        require("obsidian").setup(opts)

        _G.nmap("<leader>oo", ":ObsidianOpen ", { silent = false, desc = "[Obsidian]: [o]pen file in Obsidian" })
        _G.nmap("<leader>on", ":ObsidianNew ", { silent = false, desc = "[O]bsidian: create new [n]ote" })
        _G.nmap("<leader>ow", ":ObsidianQuickSwitch ", { silent = false, desc = "[Obsidian]: quick s[w]itch note" })
        _G.nmap("<leader>of", ":ObsidianFollowLink ", { silent = false, desc = "[Obsidian]: [f]ollow link" })

        vim.o.conceallevel = 1
    end
}
