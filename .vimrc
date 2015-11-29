execute pathogen#infect()

" Allow overwriting sensible.vim defaults
runtime! plugin/sensible.vim

" Add overrides...

" Local config
"set term=xterm-256color
set background=dark
colorscheme solarized 
set number
let mapleader = ','

set encoding=utf8
set nobackup
set nowb
set noswapfile
set noundofile

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai    " Auto-indent
set si    " Smart-indent
set wrap  " Wrap lines

" Status Line
" Always show the status line
set laststatus=2

" " Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l}

" Keybinds
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" NERDTree
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>ce :NERDTreeClose<CR>
nnoremap <Leader>ef :NERDTreeFind<CR>
nnoremap <Leader>es :NERDTreeCWD<CR>

"" MiniBufExpl
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplVSplit = 20
let g:miniBufExplBRSplit = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplUseSingleClick = 1

map <Leader>mo :MBEOpen<CR>
map <Leader>mc :MBEClose<CR>
map <Leader>mt :MBEToggle<CR>
map <Leader>mf :MBEFocus<CR>

map <Leader>mn :MBEbn<CR> 	" Switch to next normal buffer in current window
map <Leader>mp :MBEbp<CR>       " Switch to prev normal buffer in current window

map <Leader>bf :MBEbf<CR>	" Move one buffer forward in most recent used buffer list
map <Leader>bb :MBEbb<CR>	" Move one buffer backward in most recent used bmb uffer list

"" Syntastic
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" HTML5 Linter
let g:syntastic_html_tidy_exec = 'tidy'

"" vim-javascript
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let javascript_enable_domhtmlcss=1

"" vim-markdown
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1

" https://github.com/plasticboy/vim-markdown
" http://www.cirosantilli.com/markdown-style-guide/
" TODO: Key config for vim-markdown

"" vim-fugitive
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" vim-airline
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" vim-gitgutter
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

