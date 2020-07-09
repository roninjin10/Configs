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

" highlight letters when using f or t
Plug 'unblevable/quick-scope'

" do cs to change surrounding
Plug 'tpope/vim-surround'

" TMUX NAVIGATOR wtih ctrl-h ctrl-j ect.
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

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

"" Toggle terminal on/off (neovim)
nnoremap <leader>t :call TermToggle(12)<CR>
inoremap <leader>t <Esc>:call TermToggle(12)<CR>
tnoremap <leader>t <C-\><C-n>:call TermToggle(12)<CR>
tnoremap <leader>f :!

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

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
colorscheme onedark

" Mappings
inoremap jj <esc>
nmap <leader>v :tabedit $NVIM_CONFIG_PATH<CR>
nmap <leader>z :tabedit ~/.config/zsh/.zshrc<CR>
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

