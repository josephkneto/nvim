local lsp = require('lsp-zero').preset()
local cmp_nvim_lsp = require('cmp_nvim_lsp')

lsp.use('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

lsp.use('clangd', {
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        'clangd',
        '--offset-encoding=utf-16',
        '--fallback-style=webkit',
    },
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = true }
    local function bind(key, cmd)
        vim.keymap.set({ 'n', 'v' }, key, cmd, opts)
    end

    bind('<leader>d', vim.diagnostic.open_float)
    bind('[d', vim.diagnostic.goto_prev)
    bind(']d', vim.diagnostic.goto_next)
    bind('<F2>', vim.lsp.buf.rename)
    bind('gd', vim.lsp.buf.definition)
    vim.keymap.set('n', '<S-Tab>', vim.lsp.buf.hover, opts)
    bind('<leader>c', vim.lsp.buf.code_action)
    bind('<leader>I', vim.lsp.buf.references)
end)

lsp.setup()

-- set up nvim-cmp
local cmp = require('cmp')
local ls = require('luasnip')
require('luasnip/loaders/from_vscode').lazy_load()

vim.keymap.set({ 'i', 's' }, '<C-n>', function()
    ls.jump(1)
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-p>', function()
    ls.jump(-1)
end, { silent = true })

cmp.setup({
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Cr>'] = cmp.mapping.confirm({ select = true }),
        ['<C-q>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<A-p>'] = cmp.mapping.select_prev_item(),
        ['<A-n>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lsp' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<C-n>'] = {
            c = function(f) f() end,
        },
        ['<C-p>'] = {
            c = function(f) f() end,
        },
        ['<C-h>'] = {
            c = function() end,
        },
        ['<C-j>'] = {
            c = function() end,
        },
    }),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})

-- Show inline errors

local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false, -- Change here to see errors in both insert and normal modes
    severity_sort = true,
})
