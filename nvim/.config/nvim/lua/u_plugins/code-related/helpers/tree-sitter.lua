-----------------------------------------------------------
-- Plugin for implementing functionality of parser generator tool and an incremental parsing library.
-- It can build a concrete syntax tree for a source file and efficiently update the syntax tree as the source file is edited.

-- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim 
-- and to provide some basic functionality such as highlighting based on it:
-----------------------------------------------------------

local status_ok, tree_sitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

tree_sitter.setup({
  -- A list of parser names, or "all"
  -- ensure_installed = { "c", "cpp", "lua", "python", "bash", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  parser_install_dir = "~/.config/nvim/tree-sitter_parsers",

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  refactor = {

    highlight_current_scope = {
      enable = false,
    },

    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },

    -- NOTE: Treesitter mappings (rename, navigation, incremental_selection)

    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },

    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  autotag = {
    enable = true,
  },

  -- nvim-ts-context-commentstring setup
  context_commentstring = {
    enable = true,
  },
})

vim.opt.runtimepath:append("~/.config/nvim/tree-sitter_parsers")
