	let mapleader =" "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'tpope/vim-surround'
" Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
" Plug 'dense-analysis/ale'
Plug 'vim-conf-live/vimconflive2021-colorscheme' " or other package manager
Plug 'gruvbox-community/gruvbox'
Plug 'luisiacc/gruvbox-baby'
" Plug 'mattn/emmet-vim'
Plug 'sbdchd/neoformat'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

lua require ('plugins')
lua require ('treesitter')
lua require('lsp')
lua require('comp')

set title
set exrc
set signcolumn=no

colorscheme gruvbox-baby
colorscheme gruvbox
set incsearch
set guicursor=
set go=a
set bg=dark
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set nowrap
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set colorcolumn=100
set scrolloff=8
" Some basics:
	" nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
"netrw
    map <leader>n :Ex<CR>

" Nerd tree
	" map <leader>n :NERDTreeToggle<CR>
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    " if has('nvim')
        " let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    " else
        " let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    " endif
    "no  backup file

	set nobackup       "no bafiles
	set nowritebackup  "only in case you don't wa bfile while editing
	set noswapfile
" vimling:
	nm <leader><leader>d :call ToggleDeadKeys()<CR>
	imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader><leader>i :call ToggleIPA()<CR>
	imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader><leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, savi a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	" map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	" map <leader>r :vsp<space>$REFER<CR

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Delete current selection and send it in void reg
	vnoremap <leader>p "_dP

" Move visually sleceted lines up or down
	vnoremap K :m '<-2'<CR>gv=gv
	vnoremap J :m '>+1'<CR>gv=gv

" Runs a script t hat cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex<CR>
	let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	" autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=dark
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
        autocmd BufWritePost ~/.Xresources !xrdb %
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar:
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

" ale sings for errors and warnings
	" let g:ale_sign_error = '❌'
	" let g:ale_sign_warning = '⚠️'

" set transparent background
        hi Normal guibg=NONE ctermbg=NONE
	" let g:user_emmet_leader_key=','
	" let g:user_emmet_install_global = 0
	" autocmd FileType html,css EmmetInstall

	source ~/.config/nvim/latex.vim

" Replace Esc with Caps_Lock
	" au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
	" au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Find files using Telescope command-line sugar.
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	nnoremap <leader>e <cmd>Ex<cr>

" set color for cursor-line-number
	set cursorline
	set cursorlineopt=number
	autocmd ColorScheme * highlight CursorLineNr cterm=bold term=bold gui=bold

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
