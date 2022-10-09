-----------------------------------------------------------
-- Define and aquire lua modules
-----------------------------------------------------------

-- Nvim optimizations acquisition
require("u_plugins.impatient")


-- Nvim essentials acquisition
require("u_essentials.packer_config")
require("u_essentials.keymappings")
require("u_essentials.settings")
-- require("lua.u_essentials.reload")


-- Nvim appearance acquisition
require("u_plugins.appearance.themes")
require("u_plugins.appearance.vim-illuminate")
require("u_plugins.appearance.zen-mode")
require("u_plugins.appearance.indent-blankline")
require("u_plugins.appearance.todo")
-- require("u_plugins.appearance.shade")


-- Nvim everyday helpers acquisition
-- require("u_plugins.everyday_helpers.barbar")
require("u_plugins.everyday_helpers.bufferline")
require("u_plugins.everyday_helpers.buf_helper")
require("u_plugins.everyday_helpers.dashboard")
require("u_plugins.everyday_helpers.lualine")
require("u_plugins.everyday_helpers.nvim-tree")
require("u_plugins.everyday_helpers.telescope")
require("u_plugins.everyday_helpers.project")
require("u_plugins.everyday_helpers.terminal")
require("u_plugins.everyday_helpers.trouble")
require("u_plugins.everyday_helpers.whichkey")
require("u_plugins.everyday_helpers.windows")
-- require("u_plugins.everyday_helpers.sidebar")

-- Nvim code-related acquisition
--     ----- lsp
require("u_plugins.code-related.lsp.lsp_config")
require("u_plugins.code-related.lsp.lsp_saga")
require("u_plugins.code-related.lsp.null-ls")
require("u_plugins.code-related.lsp.nlspsettings")
require("u_plugins.code-related.lsp.comments")

--     ----- completitions
require("u_plugins.code-related.completition.nvim-cmp")
require("u_plugins.code-related.completition.nvim-autopairs")

--    ----- debug
require("u_plugins.code-related.debug.nvim-dap")
require("u_plugins.code-related.debug.dap-ui")
require("u_plugins.code-related.debug.dap_virtualtext")

--    ----- git
require("u_plugins.code-related.git.git_config")


--    ----- Tasks
require("u_plugins.code-related.tasks.cmake_cargo")

--     ----- helpers
-- TODO: mason in lsp or here?
require("u_plugins.code-related.helpers.tree-sitter")

-- require("u_plugins.clangd")
