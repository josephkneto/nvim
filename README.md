# Neovim Configuração Pessoal

Esta é a minha configuração personalizada do Neovim, focada em produtividade, navegação eficiente, integração com LSP, busca global, atalhos inspirados no VSCode e uma experiência moderna de desenvolvimento.

---

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Estrutura dos Arquivos](#estrutura-dos-arquivos)
- [Principais Plugins](#principais-plugins)
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
│   ├── init.lua
│   ├── set.lua           # Opções do Neovim
│   ├── remaps.lua        # Atalhos personalizados
│   ├── pckr.lua          # Gerenciador de plugins
│   └── null_ls.lua       # Integração com null-ls
├── init.lua              # Carrega o núcleo da configuração
├── README.md             # Este arquivo
└── pack/github/start/    # Plugins instalados manualmente (ex: copilot.vim)
```

---

## Principais Plugins

- **[pckr.nvim](https://github.com/lewis6991/pckr.nvim)**: Gerenciador de plugins.
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**: Busca de arquivos, texto, referências, etc.
- **[nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)**: Barra lateral de arquivos (estilo VSCode).
- **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)**: Navegador de arquivos minimalista.
- **[VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim)**: Configuração simplificada de LSP.
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**: Syntax highlighting avançado.
- **[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)**: Autocompletar.
- **[github/copilot.vim](https://github.com/github/copilot.vim)**: GitHub Copilot.
- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)**: Formatação automática.
- **[jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)**: Integração com formatadores e linters externos.
- **[windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)**: Autopares de parênteses/chaves.
- **[tpope/vim-commentary](https://github.com/tpope/vim-commentary)**: Comentários rápidos.
- **[tpope/vim-surround](https://github.com/tpope/vim-surround)**: Manipulação de surrounds.
- **[phaazon/hop.nvim](https://github.com/phaazon/hop.nvim)**: Navegação rápida no buffer.
- **[EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)**, **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)**, **[olimorris/onedarkpro.nvim](https://github.com/olimorris/onedarkpro.nvim)**: Temas.

---

## Funcionalidades e Atalhos

### Navegação de Arquivos

- `<leader>e` — Abre o Oil (navegador minimalista)
- `<C-b>` — Abre/fecha a barra lateral do NvimTree (estilo VSCode)

### Busca e Referências

- `<leader>fa` — Buscar arquivos (Telescope)
- `<leader>fg` — Buscar arquivos git (Telescope)
- `<leader>fo` — Buscar arquivos recentes (Telescope)
- `<leader>fs` — Buscar texto globalmente (Telescope, igual Ctrl+Shift+F do VSCode)
- `<leader>F` — Alternativa para busca global de texto
- `<leader>r` — Buscar todas as referências/usos do símbolo sob o cursor (Telescope)
- `gr` — Atalho nativo LSP para referências

### LSP (Language Server Protocol)

- `<C-LeftMouse>` — Ctrl+Click para ir para definição (igual VSCode, fecha a barra inferior automaticamente)
- `gd` — Ir para definição (teclado)
- `<leader>d` — (Se configurado) Ir para definição
- Hover, renomear, formatação, etc. disponíveis via comandos LSP padrão

### Edição e Produtividade

- `<C-s>` — Formata e salva o arquivo
- `<leader>s` — Formata o arquivo
- `<leader>a` — Seleciona tudo
- `<C-q>` — Fecha o buffer
- `<C-x>` — Fecha o buffer sem salvar
- `<C-v>` — Cola do clipboard do sistema
- `<C-z>` — Undo

### Terminal Integrado

- `<leader>t` — Abre terminal na horizontal
- `<C-q>` (no terminal) — Sai do modo terminal
- `<C-d>` (no terminal) — Fecha o terminal

### Movimentação e Seleção

- `kj` (no modo insert) — Sai para o modo normal
- `J`/`K` (no modo visual) — Move linhas selecionadas para baixo/cima
- `>`, `<` (no modo visual) — Indenta mantendo seleção

### Comentários e Surround

- `<C-_>` — Comenta/descomenta linha ou seleção
- Comandos do vim-surround para manipular parênteses, aspas, etc.

---

## Configurações Gerais

- **Números de linha** ativados
- **Scrolloff** de 6 linhas
- **Tabs**: expandtab, tabstop=4, shiftwidth=4
- **Busca incremental** e highlight
- **Cores verdadeiras** (termguicolors)
- **Autoindent** ativado
- **Statusline global**
- **Clipboard** integrado via xclip (Linux/WSL)
- **Timeout** desativado para comandos rápidos

---

## Dicas de Uso

- **Plugins são gerenciados via pckr.nvim**. Para instalar/atualizar/remover, edite `lua/core/pckr.lua` e rode `:PckrSync`.
- **LSP**: Instale servidores com `:Mason` ou configure no `lsp.lua`.
- **Formatação**: O conform e null-ls cuidam de formatação automática ao salvar.
- **Atalhos de mouse**: O suporte depende do terminal. Se não funcionar, tente outro terminal ou use os atalhos de teclado.
- **Temas**: Altere o tema editando o bloco correspondente em `pckr.lua`.

---

## Temas

- **Nightfox** (padrão)
- **Tokyonight**
- **Onedarkpro**

Para trocar o tema, altere o comando `vim.cmd('colorscheme ...')` no bloco do tema desejado em `pckr.lua`.

---

## Dúvidas Frequentes

- **Como buscar por texto em todos os arquivos?**  
  Use `<leader>fs` ou `<leader>F` para abrir o Telescope em modo de busca global.

- **Como ir para a definição de uma função/classe?**  
  Use `gd` ou Ctrl+Click (`<C-LeftMouse>`).

- **Como ver todos os usos de uma função/classe?**  
  Use `<leader>r` ou `gr`.

- **Como abrir o navegador de arquivos?**  
  Use `<C-b>` para NvimTree ou `<leader>e` para Oil.

- **Como instalar um novo plugin?**  
  Adicione no `lua/core/pckr.lua` e rode `:PckrSync`.

---

## Créditos

- Baseado em diversas configurações da comunidade Neovim.
- Plugins de grandes autores do ecossistema Neovim.

---

Se tiver dúvidas ou quiser sugestões de novos fluxos, abra uma issue ou edite este README!
