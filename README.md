# Neovim Configuração Pessoal

Esta é a minha configuração personalizada do Neovim, focada em produtividade, navegação eficiente, integração com LSP, busca global, atalhos inspirados no VSCode, snippets customizados e uma experiência moderna de desenvolvimento.

---

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Estrutura dos Arquivos](#estrutura-dos-arquivos)
- [Principais Plugins](#principais-plugins)
- [Snippets Customizados](#snippets-customizados)
- [Funcionalidades e Atalhos](#funcionalidades-e-atalhos)
- [Configurações Gerais](#configurações-gerais)
- [Dicas de Uso](#dicas-de-uso)
- [Temas](#temas)
- [Dúvidas Frequentes](#dúvidas-frequentes)

---

## Pré-requisitos

- **Neovim** >= 0.8 (preferencialmente 0.9+)
- **git** (para instalar plugins)
- **xclip** (para integração de clipboard no Linux/WSL)
- **Python** e **Node.js** (para LSPs e alguns plugins)
- **Compilador C** (para plugins nativos como telescope-fzf-native)

---

## Estrutura dos Arquivos

```
.config/nvim/
├── after/plugin/         # Configurações específicas de plugins
├── lua/core/             # Configurações principais em Lua
│   ├── init.lua          # Ponto de entrada da configuração
│   ├── set.lua           # Opções do Neovim
│   ├── remaps.lua        # Atalhos personalizados
│   ├── pckr.lua          # Gerenciador de plugins
│   ├── null_ls.lua       # Integração com null-ls
│   ├── cmp.lua           # Configuração do autocompletar (nvim-cmp)
│   └── snippets.lua      # Snippets customizados
├── init.lua              # Carrega o núcleo da configuração
└── README.md             # Este arquivo
```

---

## Principais Plugins

### Navegação e Interface

- **[pckr.nvim](https://github.com/lewis6991/pckr.nvim)**: Gerenciador de plugins
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Busca de arquivos, texto, referências
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: Barra lateral de arquivos
- **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)**: Navegador de arquivos minimalista
- **[kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)**: Sistema de folding avançado
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: Barra de status moderna

### LSP e Autocompletar

- **[VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)**: Configuração simplificada de LSP
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Syntax highlighting avançado
- **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: Autocompletar inteligente
- **[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)**: Snippets customizados
- **[github/copilot.vim](https://github.com/github/copilot.vim)**: GitHub Copilot

### Produtividade

- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)**: Formatação automática
- **[jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)**: Integração com formatadores
- **[windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Autopares de parênteses/chaves
- **[tpope/vim-commentary](https://github.com/tpope/vim-commentary)**: Comentários rápidos
- **[tpope/vim-surround](https://github.com/tpope/vim-surround)**: Manipulação de surrounds
- **[phaazon/hop.nvim](https://github.com/phaazon/hop.nvim)**: Navegação rápida no buffer
- **[folke/which-key.nvim](https://github.com/folke/which-key.nvim)**: Ajuda com atalhos
- **[folke/trouble.nvim](https://github.com/folke/trouble.nvim)**: Interface melhorada para diagnósticos
- **[folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)**: Gerenciamento de TODOs
- **[folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)**: Modo foco

### Temas

- **[Mofiqul/dracula.nvim](https://github.com/Mofiqul/dracula.nvim)**: Tema Dracula (padrão)
- **[catppuccin/nvim](https://github.com/catppuccin/nvim)**: Tema Catppuccin
- **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**: Tema Tokyo Night
- **[olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim)**: Tema OneDark
- **[EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)**: Tema Nightfox

---

## Funcionalidades e Atalhos

### Navegação de Arquivos

- `<leader>e` — Abre o Oil (navegador minimalista)
- `<C-b>` — Abre/fecha a barra lateral do NvimTree
- `<leader>fa` — Buscar arquivos (Telescope)
- `<leader>fg` — Buscar arquivos git (Telescope)
- `<leader>fo` — Buscar arquivos recentes (Telescope)
- `<leader>fs` — Buscar texto globalmente (Telescope)

### Folding (nvim-ufo)

- `zR` — Abre todos os folds
- `zM` — Fecha todos os folds
- `zr` — Abre folds exceto os mais profundos
- `zm` — Fecha folds mais profundos
- `zp` — Visualiza linhas dobradas sob o cursor
- `:OpenAllFolds` — Comando para forçar abertura de todos os folds

### LSP e Autocompletar

- `<C-LeftMouse>` — Ctrl+Click para ir para definição
- `gd` — Ir para definição
- `<leader>d` — Mostrar diagnósticos
- `<leader>r` — Buscar referências
- `<C-Space>` — Ativar autocompletar
- `<Tab>` — Navegar entre sugestões e snippets

### Edição e Produtividade

- `<C-s>` — Formata e salva o arquivo
- `<leader>s` — Formata o arquivo
- `<leader>a` — Seleciona tudo
- `<C-_>` — Comenta/descomenta
- `<leader>z` — Ativa modo zen
- `<leader>td` — Gerencia TODOs
- `<leader>xx` — Abre Trouble (diagnósticos)

### Terminal

- `<leader>t` — Abre terminal na horizontal
- `<C-q>` (no terminal) — Sai do modo terminal
- `<C-d>` (no terminal) — Fecha o terminal

### Splits e Buffers

- `<leader>sv` — Split vertical
- `<leader>sh` — Split horizontal
- `<C-q>` — Fecha buffer
- `<C-x>` — Fecha buffer sem salvar

---

## Configurações Gerais

### Visual

- **Números de linha** ativados
- **Scrolloff** de 6 linhas
- **Tabs**: expandtab, tabstop=4, shiftwidth=4
- **Busca incremental** e highlight
- **Cores verdadeiras** (termguicolors)
- **Autoindent** ativado
- **Statusline global**
- **Caracteres invisíveis** visíveis (tabs, espaços, etc.)

### Performance

- **Clipboard** integrado via xclip
- **Timeout** desativado para comandos rápidos
- **Updatetime** otimizado para LSP
- **Lazyredraw** para melhor performance
- **Folding** otimizado com nvim-ufo

### LSP e Autocompletar

- **LSP Zero** para configuração simplificada
- **Treesitter** para syntax highlighting
- **nvim-cmp** com snippets prioritários
- **Conform** para formatação automática
- **Null-ls** para integração com ferramentas externas

---

## Dicas de Uso

### Folding

- Use `zp` para visualizar rapidamente o conteúdo de um fold
- O sistema de folding é baseado em Treesitter para maior precisão
- Os folds começam abertos por padrão
- Use `:OpenAllFolds` se precisar forçar a abertura de todos os folds

### LSP e Autocompletar

- Instale servidores LSP com `:Mason`
- Snippets aparecem primeiro nas sugestões
- Use `<Tab>` para navegar entre campos de snippets
- O autocompletar prioriza snippets e LSP

### Produtividade

- Use `which-key` para descobrir atalhos disponíveis
- O modo zen (`<leader>z`) é útil para focar em uma parte do código
- Trouble (`<leader>xx`) oferece uma interface melhorada para diagnósticos
- Todo Comments (`<leader>td`) ajuda a gerenciar TODOs e FIXMEs

---

## Temas

Para trocar o tema, altere o comando `vim.cmd('colorscheme ...')` no bloco do tema desejado em `set.lua`.

---

## Dúvidas Frequentes

### Folding

- **Como abrir todos os folds?**  
  Use `zR` ou `:OpenAllFolds`

- **Como visualizar o conteúdo de um fold sem abri-lo?**  
  Use `zp` com o cursor sobre o fold

### LSP e Autocompletar

- **Como instalar um servidor LSP?**  
  Use `:Mason` e selecione o servidor desejado

- **Como ver diagnósticos?**  
  Use `<leader>d` para float ou `<leader>xx` para Trouble

### Navegação

- **Como buscar por texto em todos os arquivos?**  
  Use `<leader>fs` ou `<leader>F`

- **Como navegar entre buffers?**  
  Use `<C-b>` para NvimTree ou `<leader>e` para Oil

---

## Créditos

- Baseado em diversas configurações da comunidade Neovim
- Plugins de grandes autores do ecossistema Neovim
- Inspirado em configurações modernas e produtivas

---

Se tiver dúvidas ou quiser sugestões de novos fluxos, abra uma issue ou edite este README!
