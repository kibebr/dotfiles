" sets up Vundle (plugin manager)
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'pangloss/vim-javascript'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'chriskempson/base16-vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'jaredgorski/spacecamp'
Plugin 'euclio/vim-nocturne'
Plugin 'fsharp/vim-fsharp'
Plugin 'evanleck/vim-svelte', {'branch': 'main'}
Plugin 'neovimhaskell/haskell-vim'
Plugin 'glench/vim-jinja2-syntax'
Plugin 'janko-m/vim-test'
Plugin 'embear/vim-localvimrc'
Plugin 'ParamagicDev/vim-medic_chalk'


" indentation
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" colors
syntax on
colorscheme medic_chalk
set t_Co=16
set termguicolors

"  bindings
  " copy the whole file to the system clipboard
	nnoremap <C-a> :%y+<CR>
	" :GitFiles (fzf.vim)
	nnoremap <silent> <C-f> :GitFiles<CR>
  " To open Nerd Tree
	nmap <F6> :NERDTreeToggle<CR>
	" change current word (like ciw) but repeatable with dot . for the same next
  " word
	nnoremap <silent> c<Tab> :let @/=expand('<cword>')<cr>cgn

" others
set relativenumber
set noswapfile
set backupcopy=yes

" linters
  " ale
	let g:ale_linters = {
\		'javascript': ['standard'],
\ }
	let g:ale_fixers = {'javascript': ['standard']}
	let g:ale_lint_on_save = 1
	let g:ale_fix_on_save = 1

" markdown
  " vim-instant-markdown
  let g:instant_markdown_browser = "google-chrome-stable --new-window"

" vim-test
  " jest 
  let g:test#javascript#runner = 'jest'

augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.fs   set syntax=fsharp
  autocmd BufNewFile,BufRead *.svelte   set syntax=svelte
  autocmd BufNewFile,BufRead *.svelte   set filetype=svelte
  autocmd BufNewFile,BufRead *.njk   set syntax=jinja
  autocmd BufNewFile,BufRead *.cjs   set syntax=js
augroup END

" enables project specific .vimrc
set exrc
set secure
