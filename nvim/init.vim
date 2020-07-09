" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

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

Plug 'norcalli/nvim-colorizer.lua' " adds colors to things like #ec883a

Plug 'ryanoasis/vim-devicons'

" highlight letters when using f or t
Plug 'unblevable/quick-scope'

" do cs to change surrounding
Plug 'tpope/vim-surround'

" TMUX NAVIGATOR wtih ctrl-h ctrl-j ect.
Plug 'christoomey/vim-tmux-navigator'

" helper to tell me my key bindings
Plug 'liuchengxu/vim-which-key'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Syntax highlighting for all the stuff
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-commentary'

" start screen for vim 
Plug 'mhinz/vim-startify'

Plug 'airblade/vim-rooter'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Go to 
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
	if win_gotoid(g:term_win)
		hide
	else 
		botright new
		exec "resize " . a:height
		try
			exec "buffer " . g:term_buf
		catch
			call termopen($SHELL, {"detach": 0})
			let g:term_buf = bufnr("")
			set nonumber
			set norelativenumber
			set signcolumn=no
		endtry
		startinsert!
		let g:term_win = win_getid()
	endif
endfunction

let mapleader = ","

nnoremap <silent><leader> :silent WhichKey ','<CR>
vnoremap <silent><leader> :silent <c-u> : silent WhichKeyVisual ','<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let which_key_map = {}
let g:which_key_sep = '→'
let g:which_key_user_floating_win = 0


call which_key#register(',', "g:which_key_map")

" Toggle terminal on/off (neovim)
nnoremap <leader>t :call TermToggle(12)<CR>
inoremap <leader>t <Esc>:call TermToggle(12)<CR>
tnoremap <leader>t <C-\><C-n>:call TermToggle(12)<CR>
let g:which_key_map.t = {'name': 'terminal'}
tnoremap <leader>f :!

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" use tab in normal mode to switch buffers
nnoremap <tab> :bnext<cr>
nnoremap <S-tab> :bprevious<cr>

"tabbing that persists in visual mode 
vnoremap < <gv
vnoremap > >gv

"tab completion in insert mode
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

set ignorecase " case insentitive searching
set smartcase " case-sensitive if expression contains uppercase
set hlsearch " highlight search results
set incsearch "search as we type
set number " show line umbers
set autoindent
set wildmode=list:longest " complete files like a shell
set noshowmode " Since we have the status bar we dont need this
set re=0
set mouse=a
" automatically set hidden when switching buffers without saving 
set hidden
syntax enable
set ruler
" make splits sane
set splitbelow 
set splitright 
" tabbing sane defaults
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set fileencoding=utf-8
set clipboard=unnamedplus
"faster completion
set updatetime=300 
" these two are recommended by coc
set nobackup
set noshowmode


" persistent undo 
if has('persistent_undo')
    set undofile
endif

colorscheme onedark

" Mappings
inoremap jj <esc>
let g:which_key_map.g = {'name': 'goto file'}
nmap <leader>gv :tabedit $NVIM_CONFIG_PATH<CR>
let g:which_key_map.g.v = 'vim config'
nmap <leader>gz :tabedit ~/.config/zsh/.zshrc<CR>
let g:which_key_map.g.z = 'zsh config'
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

autocmd bufwritepost init.vim source $NVIM_CONFIG_PATH
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" quickscope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg=#00C7DF'' gui=underline ctermfg=155
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81

let g:qs_max_chars=150

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

