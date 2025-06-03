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
            require('onedarkpro').setup({
                options = {
                    comments = "italic",
                    keywords = "bold",
                    bold = true,
                    italic = true,
                    underline = true,
                    cursorline = true,
                    transparency = false,
                },
                colors = {
                    bg = '#282c34',
                    fg = '#abb2bf',
                },
                highlights = {
                    Comment = { fg = '#5c6370', italic = true },
                    String = { fg = '#98c379' },
                    Function = { fg = '#61afef', bold = true },
                },
            })
        end,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { light = "latte", dark = "mocha" },
                transparent_background = false,
                term_colors = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    telescope = true,
                    treesitter = true,
                }
            })
        end,
    },
    {
        'Mofiqul/dracula.nvim',
        priority = 1000, -- Garante que o Dracula seja carregado por último
        config = function()
            require('dracula').setup({
                -- customize dracula color palette
                colors = {
                    bg = "#282A36",
                    fg = "#F8F8F2",
                    selection = "#44475A",
                    comment = "#6272A4",
                    red = "#FF5555",
                    orange = "#FFB86C",
                    yellow = "#F1FA8C",
                    green = "#50FA7B",
                    purple = "#BD93F9",
                    cyan = "#8BE9FD",
                    pink = "#FF79C6",
                    bright_red = "#FF6E67",
                    bright_green = "#5AF78E",
                    bright_yellow = "#F4F99D",
                    bright_blue = "#CAA9FA",
                    bright_magenta = "#FF92D0",
                    bright_cyan = "#9AEDFE",
                    bright_white = "#F8F8F2",
                    menu = "#21222C",
                    visual = "#3E4452",
                    gutter_fg = "#4B5263",
                    nontext = "#3B4048",
                },
                -- show the '~' characters after the end of buffers
                show_end_of_buffer = true,
                -- use transparent background
                transparent_bg = false,
                -- set custom lualine background color
                lualine_bg_color = "#44475a",
                -- set italic comment
                italic_comment = true,
                -- overrides the default highlights with table see `:h synIDattr`
                overrides = {},
            })
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
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require("nvim-tree").setup()
        end,
    },

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
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("null-ls").setup()
        end
    },
    {
        'folke/tokyonight.nvim',
        config = function()
            -- vim.cmd('colorscheme tokyonight') -- Comentado para não sobrescrever o tema padrão
        end,
    },
    {
        'EdenEast/nightfox.nvim',
        config = function()
            require('nightfox').setup({
                options = {
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                    },
                },
            })
            -- vim.cmd('colorscheme nightfox') -- Já estava comentado
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'auto',
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = {
                        'filename',
                        { 'diagnostics', sources = { 'nvim_diagnostic' } },
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
            })
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'folke/which-key.nvim',
        config = function()
            require('which-key').setup()
        end
    },
    {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('trouble').setup()
        end
    },
    {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup()
        end
    },
    {
        'folke/zen-mode.nvim',
        config = function()
            require('zen-mode').setup()
        end
    },
    -- nvim-ufo para melhor folding
    {
        'kevinhwang91/nvim-ufo',
        requires = {
            'kevinhwang91/promise-async',
            'nvim-treesitter/nvim-treesitter',
        },
        config = function()
            -- Configuração do nvim-ufo
            vim.o.foldlevel = 99      -- Garante que os folds comecem abertos
            vim.o.foldlevelstart = 99 -- Garante que os folds comecem abertos ao abrir um arquivo
            vim.o.foldenable = true

            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'treesitter', 'indent' }
                end,
                fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                    local newVirtText = {}
                    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
                    local sufWidth = vim.fn.strdisplaywidth(suffix)
                    local targetWidth = width - sufWidth
                    local curWidth = 0
                    for _, chunk in ipairs(virtText) do
                        local chunkText = chunk[1]
                        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        if targetWidth > curWidth + chunkWidth then
                            table.insert(newVirtText, chunk)
                        else
                            chunkText = truncate(chunkText, targetWidth - curWidth)
                            local hlGroup = chunk[2]
                            table.insert(newVirtText, { chunkText, hlGroup })
                            chunkWidth = vim.fn.strdisplaywidth(chunkText)
                            if curWidth + chunkWidth < targetWidth then
                                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                            end
                            break
                        end
                        curWidth = curWidth + chunkWidth
                    end
                    table.insert(newVirtText, { suffix, 'MoreMsg' })
                    return newVirtText
                end,
                -- Configurações para manter folds abertos por padrão
                open_fold_hl_timeout = 0,
                close_fold_kinds = {},
                preview = {
                    win_config = {
                        border = 'rounded',
                        winblend = 0,
                        winhighlight = 'Normal:Normal'
                    }
                }
            })

            -- Força a abertura de todos os folds em vários eventos
            local function openAllFolds()
                vim.cmd('normal zR')
                require('ufo').openAllFolds()
            end

            -- Adiciona o comando em vários eventos para garantir
            vim.api.nvim_create_autocmd({
                'BufReadPost',
                'FileReadPost',
                'BufNewFile',
                'BufWinEnter',
                'WinEnter'
            }, {
                callback = openAllFolds
            })

            -- Comando personalizado para forçar abertura de folds
            vim.api.nvim_create_user_command('OpenAllFolds', openAllFolds, {})
        end
    },
})
