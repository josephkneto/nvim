vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>e", vim.cmd.Oil)
vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "Abrir barra lateral de arquivos (NvimTree)" })

local function bind(key, cmd, mode, opts)
    if opts == nil then
        opts = { noremap = true, silent = true }
    end
    if mode == nil then
        mode = { 'n', 'v' }
    end
    vim.keymap.set(mode, key, cmd, opts)
end

bind("kj", "<Esc>", "i")

-- move
bind('J', ":m '>+1<CR>gv=gv", 'v')
bind('K', ":m '<-2<CR>gv=gv", 'v')

-- clipboard paste and yank
bind('<leader>p', '"+p')
bind('<leader>P', '"+P')
bind('<leader>y', '"+y')

-- search and replace
bind('<leader>S', ':%s//g<Left><Left>', 'n', { noremap = true })
bind('<leader>S', ":'<,'>s//g<Left><Left>", 'v', { noremap = true })

bind(']<Space>', 'o<Esc>k', 'n')
bind('[<Space>', 'O<Esc>j', 'n')

-- commentary
bind('<C-_>', ':Commentary<CR>')
bind('<C-_>', ":'<,'>Commentary<CR>", 'v')
bind('<C-_>', '<Esc>:Commentary<CR>', 'i')

-- paste without losing register
bind('p', '"0p', 'v')
bind('P', '"0P', 'v')
bind('<leader>p', 'p', 'v')
bind('<leader>P', 'P', 'v')

vim.keymap.set({ 'n', 'v' }, '<leader>fa', ':Telescope find_files<CR>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>fg', ':Telescope git_files<CR>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>fo', ':Telescope oldfiles<CR>', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<leader>fs', ':Telescope live_grep<CR>', { noremap = true })

vim.keymap.set({ 'v', 'n', 'i' }, '<C-s>', function()
    require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
    vim.cmd('w')
end)

vim.keymap.set({ 'v', 'n' }, '<leader>s', function()
    require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end)

-- select all
bind('<leader>a', 'ggVG', 'n')

-- ctrl q to quit
vim.keymap.set({ 'n', 'v' }, '<C-q>', ':q<CR>', { noremap = true })
vim.keymap.set({ 'i' }, '<C-q>', '<Esc>:q<CR>', { noremap = true })

-- ctrl w to q!
vim.keymap.set({ 'n', 'v' }, '<C-x>', ':q!<CR>', { noremap = true })
vim.keymap.set({ 'i' }, '<C-x>', '<Esc>:q!<CR>', { noremap = true })

-- remove auto comment
vim.cmd([[
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

-- turn on highlight on yank
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {}')

-- terminal
bind('<leader>t', function()
    vim.cmd('new')
    vim.cmd('wincmd J')
    vim.cmd('horizontal resize ' .. math.floor(vim.o.lines * 0.30))
    vim.cmd('terminal ')
end)
bind('<C-q>', [[<C-\><C-n>]], 't')
bind('<C-d>', [[<C-\><C-n>:bd!<CR>]], 't')

-- terminal settings
vim.cmd('au TermOpen * setlocal nonumber norelativenumber')
vim.cmd('au TermOpen * startinsert')
vim.cmd('au BufEnter * if &buftype == "terminal" | startinsert | endif')
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        local map = vim.api.nvim_buf_set_keymap
        map(0, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
    end
})

bind('>', '>gv', 'v')
bind('<', '<gv', 'v')

-- Ctrl+v = ctrl+shift+v
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })

-- Ctrl+z = undo
vim.api.nvim_set_keymap('n', '<C-z>', 'u', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>u', { noremap = true, silent = true })

-- Ctrl+Click para ir para definição (igual VSCode)
vim.api.nvim_set_keymap('n', '<C-LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Fecha a location list automaticamente após ir para definição (LSP)
vim.api.nvim_create_autocmd("User", {
    pattern = "LspJumpToLocation",
    callback = function()
        vim.cmd("lclose")
    end,
})

-- Sobrescreve o comando de ir para definição para disparar o evento User/LspJumpToLocation
vim.keymap.set('n', '<C-LeftMouse>', function()
    local params = vim.lsp.util.make_position_params()
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result, ctx, _)
        if result and not vim.tbl_isempty(result) then
            vim.lsp.util.jump_to_location(result[1], 'utf-8')
            vim.api.nvim_exec_autocmds('User', {pattern = 'LspJumpToLocation'})
        end
    end)
end, { desc = 'Ir para definição (LSP) e fechar location list' })

-- <leader>r para buscar referências (Telescope LSP)
vim.keymap.set('n', '<leader>r', ':Telescope lsp_references<CR>', { desc = 'Procurar referências (Telescope LSP)' })

-- Zen Mode
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>', { desc = 'Zen Mode' })

-- Atalhos para splits
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>sh', '<cmd>split<cr>', { desc = 'Horizontal Split' })

-- Atalhos para folding
vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Abrir todos os folds' })
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Fechar todos os folds' })
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Abrir folds exceto os mais profundos' })
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Fechar folds mais profundos' })
vim.keymap.set('n', 'zp', require('ufo').peekFoldedLinesUnderCursor, { desc = 'Visualizar linhas dobradas sob o cursor' })
