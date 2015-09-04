execute pathogen#infect()

" Allow overwriting sensible.vim defaults
runtime! plugin/sensible.vim

" Add overrides...

" Local config
set number
let mapleader = ','

" Keybinds
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


