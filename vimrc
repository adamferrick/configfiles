set nocompatible

set path=.,**

set omnifunc=syntaxcomplete#Complete

set wildmenu

set showcmd

set hlsearch
nnoremap <C-L> :noh<CR><C-L>

set ignorecase
set smartcase

set backspace=indent,eol,start

set ruler

set confirm

set visualbell
set t_vb=

set cmdheight=2

set number
set relativenumber

set scrolloff=3

set pastetoggle=<F11>

set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
if has("autocmd")
    filetype plugin indent on
endif

" dim colorscheme from https://github.com/jeffkreeftmeijer/vim-dim
set cursorline
set background=dark
colorscheme dim
syntax enable
set showtabline=2
hi TabLine      ctermfg=15  ctermbg=8   cterm=bold
hi TabLineFill  ctermfg=15  ctermbg=8   cterm=bold
hi TabLineSel   ctermfg=8   ctermbg=15  cterm=bold

nnoremap <Leader>c :set cursorcolumn!<CR>


" File navigation
nnoremap <Leader>t :Texplore<CR>




" Cursor in terminal
" https://vim.fandom.com/wiki/Configuring_the_cursor
" 1 or 0 -> blinking block
" 2 solid block
" 3 -> blinking underscore
" 4 solid underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

if &term =~ '^xterm'
" normal mode
let &t_EI .= "\<Esc>[0 q"
" insert mode
let &t_SI .= "\<Esc>[5 q"
" replace mode
let &t_SR .= "\<Esc>[3 q"
endif



" Configuring the tabline
" Modified from http://www.offensivethinking.org/data/dotfiles/vimrc
if exists("+showtabline")
  function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " set up some oft-used variables
      let tab = i + 1 " range() starts at 0
      let winnr = tabpagewinnr(tab) " gets current window of current tab
      let buflist = tabpagebuflist(tab) " list of buffers associated with the windows in the current tab
      let bufnr = buflist[winnr - 1] " current buffer number
      let bufname = bufname(bufnr) " gets the name of the current buffer in the current window of the current tab
      let bufmodified = getbufvar(bufnr, "&mod")

      let s .= '%' . tab . 'T' " start a tab
      let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#') " if this tab is the current tab...set the right highlighting
      let s .= ' ' . tab " current tab number
      let n = tabpagewinnr(tab,'$') " get the number of windows in the current tab
      if n > 1
        let s .= ':' . n " if there's more than one, add a colon and display the count
      endif
      if bufmodified
        let s .= ' [+]'
      endif
      if bufname != ''
        let s .= ' ' . fnamemodify(bufname, ':t') . ' ' " outputs the filename
      else
        let s .= ' [No Name] '
      endif
      if tab == tabpagenr()
        let s .= '%#TabLine#'
        let s .= ''
      elseif tab == tabpagenr() - 1
        let s .= '%#TabLineSel#'
        let s .= ''
      else
        let s .= ''
      endif
    endfor
    let s .= '%#TabLineFill#' " blank highlighting between the tabs and the righthand close 'X'
    let s .= '%T' " resets tab page number?
    let s .= '%=' " seperate left-aligned from right-aligned
    let s .= '%#TabLine#' " set highlight for the 'X' below
    let s .= '%999XX' " places an 'X' at the far-right
    return s
  endfunction
  set tabline=%!MyTabLine()
endif



" Configuring the statusline
" Modified from https://shapeshed.com/vim-statuslines/
set laststatus=2
set statusline=
set statusline+=%#TabLine#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %=
set statusline+=%y
set statusline+=\ \ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \ \[%{&fileformat}\]
set statusline+=\ \ %p%%
set statusline+=\ \ %l:%c
set statusline+=\ 
