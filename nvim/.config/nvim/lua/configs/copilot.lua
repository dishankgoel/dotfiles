vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'solarized',
    -- group = ...,
    callback = function()
        vim.api.nvim_set_hl(0, 'CopilotSuggestion', {
            fg = '#555555',
            ctermfg = 8,
            force = true
        })
    end
})
vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-word)')
vim.g.copilot_no_tab_map = true
vim.g.copilot_workspace_folders = {"~/Documents/"}
