local pckr_path = vim.fn.stdpath('data') .. '/pckr/pckr.nvim'

if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/lewis6991/pckr.nvim',
        pckr_path,
    })
end

vim.opt.rtp:prepend(pckr_path)

require('pckr').add({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    },
    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                requires = 'williamboman/mason.nvim',
            },
            {
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                requires = 'williamboman/mason.nvim',
            },

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',

            -- Formatting
            {
                'stevearc/conform.nvim',
                requires = 'williamboman/mason.nvim',
            },
        },
    },

    {
        'olimorris/onedarkpro.nvim',
        config = function()
            vim.cmd('colorscheme onedark')
        end,
    },
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end,
    },
    'tpope/vim-commentary',

    'github/copilot.vim',

    'tpope/vim-surround',

    'stevearc/oil.nvim',

    'romainl/vim-cool',

    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            -- place this in one of your configuration file(s)
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection
            vim.keymap.set('', 'f', function()
                hop.hint_char1({ direction = { directions.AFTER_CURSOR, directions.BEFORE_CURSOR }, current_line_only = false })
            end, { remap = true })
        end
    }

})
