"repositories {{{1
call plug#begin('~/.config/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'bigbrozer/vim-nagios'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'ekalinin/Dockerfile.vim'
Plug 'embear/vim-localvimrc'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/lightline.vim' | Plug 'mengelbrecht/lightline-bufferline'
Plug 'junegunn/vim-slash'
Plug 'kana/vim-textobj-user' | Plug 'bps/vim-textobj-python'
Plug 'lambdalisue/fern.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'liuchengxu/vista.vim'
Plug 'lsdr/monokai'
Plug 'machakann/vim-highlightedyank'
Plug 'mattn/emmet-vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'nanotech/jellybeans.vim'
Plug 'othree/xml.vim'
Plug 'vim-python/python-syntax'
Plug 'rodjek/vim-puppet'
Plug 'tfnico/vim-gradle'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch' | Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-pandoc/vim-pandoc-syntax' | Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-scripts/groovyindent-unix'
Plug 'vim-scripts/matchit.zip'
Plug 'lervag/vimtex'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"preferred editor setup {{{1
" nvim specfic settings {{{2
set inccommand=nosplit

"properties {{{2
" set powerline Fonts
if has("gui_running") &&  ! has('mac')
  "set guifont=DejaVu\ Sans\ Mono\ 10
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  "set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
  "set guifont=Liberation\ Mono\ for\ Powerline\,Literation\ Mono\ Powerline\ 10
  "set guifont=Anonymous\ Pro\ for\ Powerline\,Anonymice\ Powerline\ 12
  "set guifont=Inconsolata\ for\ Powerline\ 12
  "set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
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
set spellsuggest+=10            " limit spell suggestions to 10


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
silent! colorscheme solarized8
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
endif"}}}
" mappings {{{2
" set <Leader> to <space> instead of \
let mapleader=" "

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" open file in the same dir
cmap ee e <C-R>=expand("%:p:h") . "/" <CR>

" remove trailing spaces
nmap _$ :%s/\v\s+$//e<CR>

" Set current working directory to current file
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Set current working directory to git project root (requires fugitive)
nnoremap <Leader>cp :Glcd<CR>:pwd<CR>

" source current line or visual selection
vnoremap <Leader>So y:execute @@<CR>:echo 'Sourced selection.'<CR>
nnoremap <Leader>So ^vg_y:execute @@<CR>:echo 'Sourced line.'<CR>

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

"plugin settings {{{1
"python {{{2
let g:python_highlight_all = 1
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
      \   'right': [ [ 'lineinfo', 'cocstatus'],
      \            [ 'percent'],
      \            [ 'obsession', 'fileformat', 'fileencoding'] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'obsession': 'LightlineObsession',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
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
" solarized {{{2
silent! call togglebg#map("<F10>")
" coc.vim {{{2
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
let g:coc_global_extensions=['coc-json', 'coc-python', 'coc-lists', 'coc-yaml', 'coc-metals', 'coc-tsserver', 'coc-snippets', 'coc-vimlsp']

" navigation
nnoremap <Leader>f :CocList --top files<CR>
nnoremap <Leader>n :lcd $NOTES<CR>:CocList --top files<CR>
nnoremap <Leader>e :CocList --top -I symbols<CR>
nnoremap <Leader>E :CocList --top tags<CR>
nnoremap <Leader>w :CocList --top windows<CR>
nnoremap <Leader>b :CocList --top buffers<CR>
nnoremap <Leader>a :CocList --top lists<CR>
nnoremap <Leader>D :CocList --top diagnostics<CR>

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList --top grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>s :exe 'CocList --top -I --input='.expand('<cword>').' grep'<CR>
nnoremap <silent> <Leader>S :exe 'Rg '.expand('<cword>')<CR>

" list navigatation
nmap ]z :<C-u>CocNext<CR>
nmap [z :<C-u>CocPrev<CR>

" diagnostics navigatation
nmap ]g <Plug>(coc-diagnostic-next)
nmap [g <Plug>(coc-diagnostic-prev)

" remap keys for gotos
nmap <silent> gi <Plug>(coc-definition)
nmap <silent> gI <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gF <Plug>(coc-format)
nmap <silent> gA <Plug>(coc-codeaction)

nmap <leader>rn <Plug>(coc-rename)

" text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" local-vimrc {{{2
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
" pandoc {{{2
let g:pandoc#folding#fdc = 0
let g:pandoc#spell#default_langs = ['en', 'pl']
let g:pandoc#syntax#codeblocks#embeds#langs = ['java', 'python', 'bash=sh', 'sql', 'groovy']
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
