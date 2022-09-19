-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

-- Define shortcut for keymapping
local vm = vim
local function map(mode, btn, action, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vm.tbl_extend('force', options, opts)
    end
    vm.keymap.set(mode, btn, action, options)
end

function _G.ReloadConfig()
    for name, _ in pairs(package.loaded) do
        -- if name:match('^user') and not name:match('nvim-tree') then
        if name:match('^lua') and not name:match('packer_init') then
            package.loaded[name] = nil
        end
    end

    dofile(vm.env.MYVIMRC)
    vm.notify("Nvim configuration reloaded!", vm.log.levels.INFO)
end

-- Set <Space> as <Leader>
-- map('n', '<Space>', '<NOP>')         -- clear bindings on <Space>
-- vm.g.mapleader = ' '

-- Create new file
map('n', '<Leader>fn', '<cmd>enew<CR>')

-- Create new window
map('n', '<Space>v', '<cmd>vs<CR>')
map('n', '<Space>h', '<cmd>hs<CR>')

-- Toggle search highlighting
map('n', '<Leader>h', '<cmd>set hlsearch!<CR>')

-- Reload and edit configuration without restart nvim
-- map('n', '<Leader>r', '<cmd>so $MYVIMRC<CR>', { silent = false })
map('n', '<Leader>r', '<cmd>lua ReloadConfig()<CR>', { silent = false })
--map('n', '<Leader>r', '<cmd>lua ReloadConfig()<CR>', { silent = false })
map('n', '<Leader>e', '<cmd>e $MYVIMRC<CR>')

-- Fast saving
map('n', '<Leader>s', '<cmd>w<CR>', { silent = false })
-- map('i', '<Leader>s', '<Esc>:w<CR>', { silent = false })

-- Close all windows and exit from Neovim
map('n', '<leader>q', '<cmd>qa!<CR>')
-- map('i', '<leader>q', '<Esc>:qa!<CR>')

-- Better between window movement
map('n', '<C-h>', '<C-w>h', { noremap = false })
map('n', '<C-j>', '<C-w>j', { noremap = false })
map('n', '<C-k>', '<C-w>k', { noremap = false })
map('n', '<C-l>', '<C-w>l', { noremap = false })

map('n', '<C-left>', '<C-w>h', { noremap = false })
map('n', '<C-down>', '<C-w>j', { noremap = false })
map('n', '<C-up>', '<C-w>k', { noremap = false })
map('n', '<C-right>', '<C-w>l', { noremap = false })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Better Escape
-- map('i', 'jk', '<ESC>')
-- map('i', 'kj', '<ESC>')
-- map('i', 'jj', '<ESC>')

-- Buffer operations
-- map('n', '<Tab>', '<cmd>bnext<CR>')
-- map('n', '<S-Tab>', '<cmd>bprev<CR>')
map('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>')
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>')
map('n', '<Space>dd', '<cmd>BufDel<CR>')
map('n', '<Space>df', '<cmd>BufDel!<CR>')
map('n', '<Space>db', ':BufDel' .. ' ', { silent = false })

-- Move lines up/down
map('n', '<A-j>', '<cmd>m .+1<CR>==')
map('n', '<A-k>', '<cmd>m .-2<CR>==')
map('n', '<A-down>', '<cmd>m .+1<CR>==')
map('n', '<A-up>', '<cmd>m .-2<CR>==')
-----------------------------------
map('i', '<A-j>', '<cmd>m .+1<CR>==gi')
map('i', '<A-k>', '<cmd>m .-2<CR>==gi')
map('i', '<A-down>', '<cmd>m .+1<CR>==')
map('i', '<A-up>', '<cmd>m .-2<CR>==gi')
-----------------------------------
map('v', '<A-j>', '<cmd>m \'>+1<CR>gv=gv')
map('v', '<A-k>', '<cmd>m \'<-2<CR>gv=gv')
map('v', '<A-down>', '<cmd>m \'>+1<CR>gv=gv')
map('v', '<A-up>', '<cmd>m \'<-2<CR>gv=gv')

-----------------------------------------------------------
-- Applications and Plugins shortcuts

-- NvimTree
map('n', '<C-n>', '<cmd>NvimTreeToggle<CR>') -- open/close
map('n', '<Leader>f', '<cmd>NvimTreeRefresh<CR>') -- refresh
map('n', '<Leader>n', '<cmd>NvimTreeFindFile<CR>') -- search file

-- -- Barbar
-- -- Move to previous/next
-- map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
-- map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- -- Re-order to previous/next
-- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
-- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- -- Goto buffer in position...
-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
-- map('n', '<A-0>', '<Cmd>BufferLast<CR>')
-- -- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- -- Close buffer
-- map('n', '<A-c>', '<Cmd>BufferClose<CR>')
-- -- Wipeout buffer
-- --                 :BufferWipeout
-- -- Close commands
-- --                 :BufferCloseAllButCurrent
-- --                 :BufferCloseAllButPinned
-- --                 :BufferCloseAllButCurrentOrPinned
-- --                 :BufferCloseBuffersLeft
-- --                 :BufferCloseBuffersRight
-- -- Magic buffer-picking mode
-- map('n', '<C-p>', '<Cmd>BufferPick<CR>')
-- -- Sort automatically by...
-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>')
-- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>')
-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>')
--
-- -- Other:
-- -- :BarbarEnable - enables barbar (enabled by default)
-- -- :BarbarDisable - very bad command, should never be used


-- LSP
map('n', '<space>L', '<cmd>LspInfo<CR>')
-- map('n', '<space>e', vm.diagnostic.open_float)
-- map('n', '[d', vm.diagnostic.goto_prev)
-- map('n', ']d', vm.diagnostic.goto_next)
-- map('n', '<space>q', vm.diagnostic.setloclist)

-- Telescope
map('n', '<leader>fc', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>k', '<cmd>Telescope keymaps<cr>')

map('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
map('n', '<leader>gp', '<cmd>Telescope git_bcommits<cr>')
map('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_status<cr>')
map('n', '<leader>gs', '<cmd>Telescope git_stash<cr>')

-- Zen
map({ 'n', 'i', 'v' }, '<A-z>', '<cmd>ZenMode<CR>')

-- Todo
map('n', '<Leader>to', '<cmd>TodoTelescope<CR>')
map('i', '<Leader>to', '<cmd>TodoTelescope<CR>')

-- project_nvim
map({ 'n', 'i' }, '<Leader>p', '<cmd>Telescope projects<CR>')

-- Trouble
map("n", "<leader>tt", "<cmd>TroubleToggle<cr>")
map("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>tf", "<cmd>TroubleToggle document_diagnostics<cr>")
map("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>")
map("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>")
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")

-- DAP
map("n", "<F5>", "<Cmd>lua require('dap').continue()<CR>")
map("n", "<F10>", "<Cmd>lua require('dap').step_over()<CR>")
map("n", "<F11>", "<Cmd>lua require('dap').step_into()<CR>")
map("n", "<F12>", "<Cmd>lua require('dap').step_out()<CR>")
map("n", "<F9>", "<Cmd>lua require('dap').toggle_breakpoint()<CR>")
map("n", "<Leader>B", "<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<Leader>lp", "<Cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<Leader>dr", "<Cmd>lua require('dap').repl.open()<CR>")
map("n", "<Leader>dl", "<Cmd>lua require('dap').run_last()<CR>")

-- Git conflict
map('n', 'co', '<Plug>(git-conflict-ours)')
map('n', 'ct', '<Plug>(git-conflict-theirs)')
map('n', 'cb', '<Plug>(git-conflict-both)')
map('n', 'c0', '<Plug>(git-conflict-none)')
map('n', ']x', '<Plug>(git-conflict-prev-conflict)')
map('n', '[x', '<Plug>(git-conflict-next-conflict)')

-- TASKS
