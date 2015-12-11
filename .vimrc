set nocompatible
filetype off

if filereadable(expand("~/.vimrc.before"))
    source ~/.vimrc.before
endif

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

" General Config
filetype plugin indent on
syntax on
set mouse=a
set mousehide
scriptencoding utf-8

set splitbelow
set splitright

autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
set autowrite

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

if !has('gui')
    set term="$TERM" " Should be xterm-256colors, currently set in ~/.zlogin
    t_Co=256

    " UI Config 
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
"    color solarized             " Load a colorscheme

    color zenburn
endif

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

set cursorline                  " Highlight current line

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color from current line number

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    if !exists('g:override_spf13_bundles')
        set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}
endif

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace


let mapleader = ','

set encoding=utf-8
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

" Filetype Dependent Settings

"Flag evil whitespace
" NOTE: python-mode & linters should handle this...
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Pyton PEP8 Adherance
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set ff=unix

" Javascript, HTML5, CSS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


" " Format the status line
" "set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l}

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

"" vim-airline-weather
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:weather#area = 'south carolina,us'
" let g:weather#unit = 'metric'
" let g:weather#appid = 'fc72e0c99a99ed1510d0938fd3b2ce81'

" This extension use a cache file to store weather informations, and update the weather information every hour as default, you may change it with caution, update too frequently will slow down vim.
" let g:weather#cache_file = '~/.cache/.weather'
" let g:weathre#cache_ttl = '3600'
" let g:weather#format = '%s %.0f'

" let g:weather#status_map = {
" \ "01": "☀",
" \ "02": "☁",
" \ "03": "☁",
" \ "04": "☁",
" \ "09": "☂",
" \ "10": "☂",
" \ "11": "☈",
" \ "13": "❅",
" \ "50": "≡",
" \}

"" vim-gitgutter
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" python-mode
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-g>"
"
" " Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-F5>"
"
" " Override view python doc key shortcut to Ctrl-Shift-d
" " Current: <K>
" let g:pymode_doc_bind = "<C-S-d>"


" YouCompleteMe
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

