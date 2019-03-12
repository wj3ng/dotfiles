"===================================================================
"========================== VUNDLE =================================
"===================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim		" set the runtime path to include Vundle and initialize
call vundle#begin()						"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'			" let Vundle manage Vundle, required

" PLUGIN EXAMPLES
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline-fonts'

Plugin 'octol/vim-cpp-enhanced-highlight'	" syntax highlighting for c++
Plugin 'mboughaba/i3config.vim'				" syntax highlighting for i3 config
Plugin 'digitaltoad/vim-pug'				" syntax highlighting for pug (jade)

Plugin 'ap/vim-css-color'

Plugin 'tyrannicaltoucan/vim-quantum'		" quantum colorscheme

Plugin 'junegunn/goyo.vim'					" distraction free viewing

Plugin 'jiangmiao/auto-pairs'				" bracket autocomplete

Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"===================================================================

" basic settings
set t_Co=256				" 256 colors
set number relativenumber	" show relative line numbers
set scrolloff=10			" starts scrolling when 10 lines near the end
syntax on					" enable syntax highlighting
set encoding=utf-8
filetype plugin on

" Enable autocompletion:
set wildmode=longest,list,full
	
" Disable automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" indentation
set tabstop=4
set shiftwidth=4
set autoindent

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
set clipboard=unnamedplus

" AIRLINE SETUP
set laststatus=2		" always show status bar
let g:airline_powerline_fonts = 1
let g:airline_theme='quantum'

" COLORSCHEME
set termguicolors
set background=dark
let g:quantum_black=1
colorscheme quantum

" Ctrl-S to save
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>update<CR>
:inoremap <c-s> <Esc>:update<CR>
vmap <C-s> <esc>:w<CR>gv

" Toggle relative or absolute number lines with \n
function! NumberToggle()
	if(&rnu == 1)
		set nornu
	else
        set rnu
    endif
endfunction
nnoremap <silent><leader>n :call NumberToggle()<CR>

set splitbelow splitright		" Splits open at the bottom and right

" Shortcutting split navigation, saving a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Goyo plugin makes text more readable when writing prose:
map <leader>g :Goyo \| set linebreak<CR>

" fix delay after pressing esc
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

let g:vimtex_view_method='zathura'
