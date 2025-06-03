vim.opt.nu = true
vim.opt.scrolloff = 6

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.autoindent = true

vim.opt.cursorline = true

vim.opt.laststatus = 3

-- wsl clipboard
vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = 0,
}

vim.opt.timeout = false

-- Tema padrão
vim.cmd('colorscheme dracula') -- Você pode mudar para 'catppuccin' ou 'nightfox' se preferir

-- Melhorias de busca
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Melhorias de performance e usabilidade
vim.opt.updatetime = 300  -- Melhor performance para LSP e git
vim.opt.undofile = true   -- Mantém histórico de undo entre sessões
vim.opt.signcolumn = "yes" -- Melhor integração com LSP
vim.opt.mouse = "a"       -- Suporte a mouse quando necessário
vim.opt.splitright = true -- Abre splits à direita
vim.opt.splitbelow = true -- Abre splits abaixo
vim.opt.wrap = false      -- Desativa quebra de linha automática
vim.opt.swapfile = false  -- Desativa arquivos de swap (opcional, mas pode melhorar performance)

-- Melhorias de performance
vim.opt.lazyredraw = true -- Reduz redraw durante execução de macros
vim.opt.ttimeoutlen = 0   -- Elimina delay ao pressionar ESC em modo insert

-- Configurações para ligaduras
vim.opt.guifont = "FiraCode Nerd Font:h12" -- Você pode ajustar o tamanho (h12) conforme necessário

-- Configurações para ligaduras
vim.g.have_nerd_font = true -- Indica que estamos usando uma fonte Nerd Font
vim.opt.conceallevel = 2 -- Habilita concealing para ligaduras
vim.opt.concealcursor = "n" -- Mantém o concealing mesmo no modo normal