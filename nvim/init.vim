call plug#begin('~/.local/share/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'neomake/neomake'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'editorconfig/editorconfig-vim'
Plug 'luochen1990/rainbow'
Plug 'semanser/vim-outdated-plugins'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
"Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'lervag/vimtex', { 'for': ['tex', 'plaintex', 'context'] }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'JuliaEditorSupport/julia-vim'
call plug#end()

set hidden
set laststatus=1
set expandtab tabstop=2 shiftwidth=2
set wildmenu wildmode=full
set spelllang=en_us,ru_ru
set number relativenumber
set ignorecase smartcase hlsearch
let mapleader = "\<space>"
let maplocalleader = ","
set completeopt=menuone,longest,preview
set mouse=a
" lang
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set listchars=tab:»·,trail:·
set list
set splitright splitbelow

" Key bindings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ack
let g:ackprg = 'ag --vimgrep'

" Theme
set termguicolors
set background=light
let g:one_allow_italics = 1
colorscheme one

" fzf
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Neomake
call neomake#configure#automake('w')

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" TeX
let g:tex_flavor = 'latex'
let g:vimtex_indent_enabled = 0
let g:vimtex_indent_on_ampersands = 0
let g:vimtex_compiler_latexmk = {
  \ 'build_dir' : 'dist',
  \}

" Funcs
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
augroup WritePreGrp
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Deoplete
"let g:deoplete#enable_at_startup = 1

" fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
noremap <leader>p :Files<cr>
noremap <leader>b :Buffers<cr>

let g:outdated_plugins_silent_mode = 1

noremap <expr> <F7> LaTeXtoUnicode#Toggle()
inoremap <expr> <F7> LaTeXtoUnicode#Toggle()

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
