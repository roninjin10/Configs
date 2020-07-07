call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-yaml', 'coc-python', 'coc-rls', 'coc-git', 'coc-eslint']
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'sbdchd/neoformat' " prettier

Plug 'itchyny/lightline.vim' " formats the status bar where INSERT is

Plug 'ap/vim-css-color' " adds colors to things like #ec883a

Plug 'ryanoasis/vim-devicons'

call plug#end()

set ignorecase " case insentitive searching
set smartcase " case-sensitive if expression contains uppercase
set hlsearch " highlight search results
set incsearch "search as we type
set number " show line umbers
set autoindent
set wildmode=list:longest " complete files like a shell
set noshowmode " Since we have the status bar we dont need this
set re=0

syntax enable
colorscheme onedark

" Mappings
inoremap jj <esc>
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Nerdtree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"  Fuzzy finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


" coc
" " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" run prettier on save
autocmd BufWritePre *.js Neoformat
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" lightline
let g:lightline = { 'colorscheme': 'onedark' }

