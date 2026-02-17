-- :map [[ ?{<CR>w99[{
-- :map ][ /}<CR>b99]}
-- :map ]] j0[[%/{<CR>
-- :map [] k$][%?}<CR>

-- Toggle between English, Ukrainian, and Both
local current_spell_mode = 0
vim.keymap.set('n', '<leader>sp', function()
    current_spell_mode = (current_spell_mode + 1) % 4
    if current_spell_mode == 0 then
        vim.opt.spell = false
        print("Spell: Off")
    elseif current_spell_mode == 1 then
        vim.opt.spell = true
        vim.opt.spelllang = "en_us"
        print("Spell: English")
    elseif current_spell_mode == 2 then
        vim.opt.spell = true
        vim.opt.spelllang = "uk"
        print("Spell: Ukrainian")
    else
        vim.opt.spell = true
        vim.opt.spelllang = "en_us,uk"
        print("Spell: Both Eng & Ukr")
    end
end, { desc = "Cycle spell languages" })
