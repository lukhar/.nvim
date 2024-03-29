"repositories {{{1
call plug#begin('~/.config/legacy-nvim/plugged')
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'bigbrozer/vim-nagios'
Plug 'cespare/vim-toml'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'ekalinin/Dockerfile.vim'
Plug 'embear/vim-localvimrc'
Plug 'hashivim/vim-terraform'
Plug 'ishan9299/nvim-solarized-lua'
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline'
Plug 'jparise/vim-graphql'
Plug 'junegunn/vim-slash'
Plug 'kana/vim-textobj-user' | Plug 'bps/vim-textobj-python'
Plug 'lambdalisue/fern.vim' | Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'
Plug 'lsdr/monokai'
Plug 'machakann/vim-highlightedyank'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'othree/xml.vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'rodjek/vim-puppet'
Plug 'tfnico/vim-gradle'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive' , { 'commit': 'c9c08ff9ef57775dbfe4ef4344f3c203bd4141ab' }
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc-syntax' | Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-scripts/groovyindent-unix'
Plug 'vim-scripts/matchit.zip'

call plug#end()

"preferred editor setup {{{1
" neovide specfic settings {{{2
if exists("g:neovide")
  let g:neovide_cursor_animation_length=0
  let g:neovide_cursor_trail_length=0
endif
" nvim specfic settings {{{2
set inccommand=nosplit

" workaround for: https://github.com/neovim/neovim/issues/22614
lua <<EOF
vim.schedule(function () vim.o.background = "dark" end)
EOF

"properties {{{2
" set powerline Fonts
if has("gui_running") &&  ! has("mac")
  set guifont=DejaVu\ Sans\ Mono\ 10
  "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
  "set guifont=Liberation\ Mono\ for\ Powerline\,Literation\ Mono\ Powerline\ 10
  "set guifont=Anonymous\ Pro\ for\ Powerline\,Anonymice\ Powerline\ 12
  "set guifont=Inconsolata\ for\ Powerline\ 12
  "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
endif

if !exists("$NOTES")
  let $NOTES="/home/lukhar/documents/shared/notes/"
endif

if has("mac")
  let $NOTES="/Users/lharatym/documents/shared/notes"
  set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h15
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4

set novisualbell                " turn off visualbell
set noerrorbells
set background=dark
set number                      " line numbers on
set showmatch                   " show matching brackets/parenthesis
set expandtab
set incsearch
set autoindent
set smartindent
set backspace=indent,eol,start  " backspace for dummies
set showmode
set ignorecase                  " case insensitive search
set smartcase                   " case sensitive when uc present
set incsearch                   " find as you type search
set hlsearch                    " highlight search terms
set autoread                    " auto reload changed files
set cursorline                  " mark cursor position
set laststatus=2                " always show status bar
set hidden                      " unsaved buffers are hidden now (no more errors when opening new file while having unsaved changes)
set mouse=a                     " enable scrolling
set shortmess+=c                " don't give |ins-completion-menu| messages
set nobackup
set nowritebackup
set path+=**                    " easier find (no **/ necessary)
set splitright                  " split on the right side of current pane
set noswapfile


" 'smart' realtive line numbers
set relativenumber
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber  number

filetype plugin on
filetype on
filetype indent on

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"color scheme
silent! colorscheme solarized
syntax on

" auto completion adjustments
set completeopt=menuone,longest         " get rid of pop up preview

set pumheight=15                        " set pop up menu to have fixed length

" write all temporary files into one directory
set directory=$HOME/.cache/nvim/swp/

" keep undo history in one directory
set undofile
set undodir=$HOME/.cache/nvim/undo/

" faster screen redraw
set lazyredraw
set ttyfast

" retain screen position when switching the buffers
if v:version >= 700
  autocmd BufLeave * let b:winview = winsaveview()
  autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" automatically remove trailing whitespace characters on save
autocmd FileType c,cpp,python,vim,js autocmd BufWritePre <buffer> :%s/\s\+$//e

" use custom python
let g:loaded_python_provider = 0
let g:python3_host_prog = '~/.pyenv/versions/neovim/bin/python'

" wildmenu {{{2
if has("wildmenu")
  set wildignore+=*.a,*.o,*.pyc
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
  set wildmode=longest:full,full " command <Tab> completion, list matches, then longest common part, then all.
endif
" mappings {{{2
" set <Leader> to <space> instead of \
let mapleader=" "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Set current working directory to current file
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Set current working directory to git project root (requires fugitive)
nnoremap <Leader>cp :Glcd<CR>:pwd<CR>

" source current line or visual selection
" vnoremap <Leader>So y:execute @@<CR>:echo 'Sourced selection.'<CR>
" nnoremap <Leader>So ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>

" more vim-like behavior
nnoremap Y y$

" map jk/kj to esc experimental
inoremap jk <Esc>
inoremap kj <Esc>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w>2<
map <silent> <A-j> <C-W>2-
map <silent> <A-k> <C-W>2+
map <silent> <A-l> <C-w>2>

" numbered search results for easier navigation
nnoremap // :g//#<Left><Left>

" use ag instaed of grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" file opening through partial matching (nested in directories or over path)
nnoremap ;e :e **/*
nnoremap ;f :find **/*
cmap eE e **/*
cmap fF find **/*

"plugin settings {{{1
" mason {{{2
"use dark backgorund
autocmd FileType mason highlight MasonNormal guibg=#002b36

" fzf {{{2
nnoremap <Leader>e :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>n :Files $NOTES<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>w :Windows<CR>
nnoremap <Leader>T :BTags<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>s :Rg<space>
nnoremap <Leader>S :Rg<CR>

" cmp {{{2
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require("cmp")

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        end
      end, { "i", "s" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" }
    }, {
      { name = "buffer" },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = {
      ["<Tab>"] = cmp.config.disable,
    },
    sources = cmp.config.sources({
      { name = "path" }
    }, {
      { name = "cmdline" }
    })
  })
EOF

" lsp" {{{2
lua << EOF
  -- uncomment for debugging
  -- vim.lsp.set_log_level("debug")

  local lspconfig = require("lspconfig")

  local buf_map = function(bufnr, mode, lhs, rhs, opts)
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
          silent = true,
      })
  end

  local function python_path()
    if vim.env.VIRTUAL_ENV then
      return lspconfig.util.path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    return exepath("python3") or exepath("python") or "python"
  end

  local on_attach = function(client, bufnr)
      vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
      vim.cmd("command! LspFormatting lua vim.lsp.buf.format { async = true }")
      vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
      vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
      vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
      vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
      vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
      vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
      vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
      vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
      vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
      vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")

      buf_map(bufnr, "n", "gi", ":LspDef<CR>")
      buf_map(bufnr, "n", "gI", ":LspTypeDef<CR>")
      buf_map(bufnr, "n", "gr", ":LspRefs<CR>")
      buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
      buf_map(bufnr, "n", "K", ":LspHover<CR>")
      buf_map(bufnr, "n", "[g", ":LspDiagPrev<CR>")
      buf_map(bufnr, "n", "]g", ":LspDiagNext<CR>")
      buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
      buf_map(bufnr, "n", "gF", ":LspFormatting<CR>")
      buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
      buf_map(bufnr, "n", "<Leader>rn", ":LspRename<CR>")
      buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

      -- uncomment autoformat on write
      -- if client.resolved_capabilities.document_formatting then
      --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      -- end
  end


  require("mason").setup({
    ui = {
      icons = {
          package_installed = "⚫",
          package_pending = "➜",
          package_uninstalled = "⚪"
      }
    }
  })

  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "efm", "tsserver", "vimls", "terraformls", "ltex" },
  }

  mason_lspconfig.setup_handlers({
    function(server_name)
      lspconfig[server_name].setup {
        on_attach = on_attach,
      }
    end,

    ["pyright"] = function()
      lspconfig.pyright.setup({
        on_attach = on_attach,

        on_init = function(client)
          client.config.settings.python.pythonPath = python_path()
        end,

        settings = {
          python = {
            analysis = {
              -- Disable strict type checking
              typeCheckingMode = "off"
            }
          }
        },
      })
    end,

    ["efm"] = function()
      lspconfig.efm.setup({
        on_attach = on_attach,

        init_options = {
          documentFormatting = true
        },

        settings = {
          rootMarkers = {".git/"},
          languages = {
            python = {
              { formatCommand = "isort --profile=black --quiet -", formatStdin = true },
              { formatCommand = "black --quiet -", formatStdin = true },
              { lintCommand = "flake8 --stdin-display-name ${INPUT} -",
                lintStdin = true,
                lintIgnoreExitCode = true,
                lintFormats = {"%f:%l:%c: %m"} }
            },
          },
        },
      })
    end,

    ["ltex"] = function()
      lspconfig.ltex.setup({
        on_attach = on_attach,

        settings =  {
          ltex = {
            enabled = { "gitcommit", "markdown", "bib", "org", "plaintex", "rst", "tex", "pandoc" },
            language = "en-GB",
          },
	      },
      })
    end,

    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,

        settings = {
           Lua = {
             diagnostics = {
               enable = true,
               globals = { "vim", "describe", "awesome", "client", "screen", "root" },
               disable = { "lowercase-global" }
             },
             workspace = {
               library = {
                       [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                       [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                       [vim.fn.expand("/usr/share/awesome/lib")] = true
               },
               maxPreload = 2000,
               preloadFileSize = 2000
             },
           },
         },
      })
    end,
  })
EOF

"tree-sitter {{{2
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"python", "rust", "java", "go", "scala", "lua", "toml", "yaml", "typescript"},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

"xml {{{2
let xml_use_xhtml = 1           " enable plugin when editing html files
"terraform-vim {{{2
let g:terraform_fold_sections=1
let g:terraform_align=1
let g:rerraform_fmt_on_save=1
"delimitMate {{{2
let b:delimitMate_expand_space = 1
let b:delimitMate_expand_cr = 2
autocmd FileType htm,html let b:delimitMate_matchpairs = '(:),[:],{:}'
autocmd FileType vim let b:delimitMate_quotes = "'"
"{{{ unimpaired
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
"UltiSnips  {{{2
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/mysnippets"]

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:ultisnips_python_quoting_style="double"
let g:ultisnips_python_style="sphinx"


if !exists("g:snips_author")
  let g:snips_author = "yourname"
endif

if !exists("g:snips_email")
  let g:snips_email = "yourname@email.com"
endif

if !exists("g:snips_github")
  let g:snips_github = "https://github.com/yourname"
endif
"lightline {{{2
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'lineinfo'],
      \            [ 'percent'],
      \            [ 'obsession', 'fileformat', 'fileencoding'] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'obsession': 'LightlineObsession',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'obsession': 'LightlineObsession'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['close']]
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineFilename()
  return expand('%')
endfunction

function! LightlineObsession()
  return '%{ObsessionStatus()}'
endfunction

"tmux-navigator {{{2
augroup navigator
  autocmd!
  autocmd FileType netrw call s:reset_netrw_keys()
augroup END

function! s:reset_netrw_keys() abort
  nmap <buffer> <silent> <C-h> <Plug>NetrwHideEdit
  nmap <buffer> <silent> <C-l> <Plug>NetrwRefresh
endfunction

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2

nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
" local-vimrc {{{2
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" pandoc {{{2
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#default_langs = ['en']
let g:pandoc#syntax#codeblocks#embeds#langs = ['python', 'sql', 'sh=bash']
" gutentags {{{2
" let g:gutentags_cache_dir = expand('~/.cache/vim/gutentags')
" let g:gutentags_file_list_command = 'rg --files'

" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0
" let g:gutentags_define_advanced_commands = 1

" let g:gutentags_ctags_extra_args = [
"       \ '--tag-relative=yes',
"       \ '--fields=+ailmnS',
"       \ ]

"command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')

" augroup MyGutentagsStatusLineRefresher
"     autocmd!
"     autocmd User GutentagsUpdating call lightline#update()
"     autocmd User GutentagsUpdated call lightline#update()
" augroup END
" highlightedyank {{{2
let g:highlightedyank_highlight_duration = 150
" vimtex {{{2
let g:tex_flavor = 'latex'
let g:vimtex_format_enabled = 1
let g:vimtex_fold_enabled = 1
if has('unix')
  if has('mac')
    let g:vimtex_view_method = 'skim'
  else
    let g:vimtex_view_method = 'zathura'
  endif
endif
" vista {{{2
let g:vista#renderer#enable_icon = 0
let g:vista#echo_cursor = 0
nnoremap <silent> <F9> :Vista<CR>
" nertw {{{2
let g:netrw_liststyle = 3
let g:netrw_localrmdir='rm -r'

" Disable netrw (for fern)
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
" fern {{{2
nnoremap - :Fern %:h -reveal=%<CR>
nnoremap _ :Fern %:h -drawer -toggle -reveal=%<CR>

function! s:init_fern() abort
  nmap <buffer><expr>
      \ <Plug>(fern-my-expand-or-collapse)
      \ fern#smart#leaf(
      \   "\<Plug>(fern-action-collapse)",
      \   "\<Plug>(fern-action-expand)",
      \   "\<Plug>(fern-action-collapse)",
      \ )

  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-collapse)
  nmap <buffer><nowait> r <Plug>(fern-action-reload)
endfunction

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

augroup my-fern
  autocmd! *
  autocmd FileType fern call s:init_fern()
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

" fixcursorhold {{{2
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
" fugitive {{{2
let g:fugitive_git_executable = 'hub'
" scripts {{{1
" execute macros over visual range {{{2
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" dim inactive panes {{{2
" Background colors for active vs inactive windows
hi ActiveWindow guibg=None
hi InactiveWindow guibg=#073642

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call HandleWinEnter()
  autocmd FocusLost * call FocusLostInactive()
  autocmd FocusGained * call FocusGainedActive()
augroup END

" Change highlight group of active/inactive windows
function! HandleWinEnter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

" Change color when focus lost
function! FocusLostInactive()
  setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
endfunction

" Change color when focus gained
function! FocusGainedActive()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

" manage git project sessions {{{2
augroup SessionManagment
  autocmd VimEnter * call OpenSession()
augroup END

function! OpenSession()
  if isdirectory(".git")
    execute ":Mkdir! .vim"
    execute ":Obsession .vim/session.vim"
  end
endfunction
" vim: foldmethod=marker tabstop=2 shiftwidth=2 expandtab
