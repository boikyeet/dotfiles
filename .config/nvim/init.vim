" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'jez/vim-superman'

Plug 'tpope/vim-surround'

Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'Olical/conjure'

Plug 'kovisoft/paredit'

Plug 'junegunn/rainbow_parentheses.vim'

" Activation based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Comment stuff out plugin
" gcc to comment out a line (takes a count)
" gc in visual mode to comment out selection
" gc to comment out taget of a motion
Plug 'tpope/vim-commentary'

" Unimpaired (bunch of mappings)
Plug 'tpope/vim-unimpaired'

" Base 16 Vim
Plug 'chriskempson/base16-vim'

" Hard time
"Plug 'takac/vim-hardtime'
"let g:hardtime_default_on = 1

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')

	let height = &lines - 3
    let width = float2nr(&columns - (&columns * 2 / 10))
 	let col = float2nr((&columns - width) / 2)

    let opts = {
	\ 'relative': 'editor',
	\ 'row': 1,
	\ 'col': col,
	\ 'width': width,
	\ 'height': height
	\ }

	call nvim_open_win(buf, v:true, opts)
endfunction

" Ultisnips
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Snippets
Plug 'honza/vim-snippets'

" Supertab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping             = 0

" Polyglot
Plug 'sheerun/vim-polyglot'

" NERDTree
 Plug 'scrooloose/nerdtree'
" Close vim if the only window left open is a NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open NERDTree key binding
 map <C-n> :NERDTreeToggle<CR>

" Bclose (needed for ranger plugin in neovim)
" Plug 'rbgrouleff/bclose.vim'

" Ranger (open with <leader>f)
" Plug 'francoiscabrol/ranger.vim'
" " open ranger when vim open a directory
" let g:ranger_replace_netrw = 1
"
" lf
Plug 'ptzz/lf.vim'

let g:lf_command_override = 'lf -command "set hidden"'

let g:NERDTreeHijackNetrw = 0 " Add this line if you use NERDTree
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory

" fzf floaterm
Plug 'voldikss/fzf-floaterm'
" floaterm
Plug 'voldikss/vim-floaterm'

" let g:lf_map_keys = 0
" map <leader>f :LfNewTab<CR>

" vimux
Plug 'NickLaMuro/vimux'
map <leader>vp :VimuxPromptCommand<cr>
" Run last command executed by VimuxRunCommand
map <leader>vl :VimuxRunLastCommand<cr>
let g:VimuxUseNearest = 1

" " MiniBufExpl
" Plug 'fholgado/minibufexpl.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count =2
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Sneak
Plug 'justinmk/vim-sneak'

" tmuxline
Plug 'edkolev/tmuxline.vim'

" Initialize plugin system
call plug#end()

" Powerline
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup
" set rtp+=/home/Tom/.local/lib/python3.6/site-packages/powerline/bindings/vim

" Base 16 shell (required for Base 16 VIM)
if filereadable(expand("~/.vimrc_background"))
let base16colorspace=256
source ~/.vim/colorscheme.vim
" source ~/.config/nvim/colorscheme.vim
endif

" MiniBufExpl bindings
" map <Leader>e :MBEOpen<cr>
" map <Leader>c :MBEClose<cr>
" map <Leader>t :MBEToggle<cr>
" noremap <Leader><TAB> 	:MBEbf<CR>
" noremap <Leader><S-TAB> :MBEbb<CR>

" Navigate windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Added settings
" set number relativenumber
set number
set colorcolumn=80
set smarttab
set shiftwidth=4
set tabstop=4
set laststatus=2
set showtabline=1
set noshowmode
set wildmenu
set hidden
set autochdir " change VIM to current file's directory
			  " (so that :e filename creates new file
			  "  in current location)
"set cursorline
" highlight only line number
" hi clear LineNr
hi clear CursorLine
hi clear CursorLineNr
" augroup CLClear
"     autocmd! ColorScheme * hi clear CursorLine
" augroup END

nnoremap <Up> 	    <C-w>v
nnoremap <Down>     <C-w>s
nnoremap <C-Down>   <C-w>c
" Split + new file
nnoremap <C-S-Down> <C-w>n
nnoremap <C-S-Up>   :vne<CR>

" \l to highlight line, 'l or `l to return to highlighted line, :match to clear
nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" \c etc for columns (NO FUNCIONA)
nnoremap <silent> <Leader>c :execute 'match Search /\%'.virtcol('.').'v/'<CR>

" Leader + number to switch to buffer
noremap <Leader>1 :buffer<Space>1<CR>
noremap <Leader>2 :buffer<Space>2<CR>
noremap <Leader>3 :buffer<Space>3<CR>
noremap <Leader>4 :buffer<Space>4<CR>
noremap <Leader>5 :buffer<Space>5<CR>
noremap <Leader>6 :buffer<Space>6<CR>
noremap <Leader>7 :buffer<Space>7<CR>
noremap <Leader>8 :buffer<Space>8<CR>
noremap <Leader>9 :buffer<Space>9<CR>
noremap <Leader>0 :buffer<Space>10<CR>

" Keep previous search history and cursor position
function! Preserve(command)
	try
		let l:win_view = winsaveview()
		let l:old_query = getreg('/')
		silent! execute 'keepjumps ' . a:command
	finally
		call winrestview(l:win_view)
		call setreg('/', l:old_query)
	endtry
endfunction

"This unsets the "last search pattern" register by hitting return
nnoremap <silent><CR> :noh<CR><CR>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" \b to delete blank lines
fun! DeleteBlanks()
	call Preserve('g/^$/d')
endfun
command! DelBlanks :call DeleteBlanks()
noremap <Leader>b :call DeleteBlanks()<CR>

" \w to delete trailing white space
fun! TrimWhitespace()
	call Preserve('%s/\s\+$//e')
endfun
command! TrimWhite :call TrimWhitespace()
noremap <Leader>w :call TrimWhitespace()<CR>

" Smooth scrolling
function SmoothScroll(up)
	if a:up
		let scrollaction=""
	else
		let scrollaction=""
	endif
	exec "normal " . scrollaction
	redraw
	let counter=1
	while counter<&scroll
		let counter+=1
		sleep 10m
		redraw
		exec "normal " . scrollaction
	endwhile
endfunction

nnoremap <silent><C-U> :call SmoothScroll(1)<Enter>
nnoremap <silent><C-D> :call SmoothScroll(0)<Enter>
inoremap <silent><C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <silent><C-D> <Esc>:call SmoothScroll(0)<Enter>i

" Automatic closing
" (this will interrupt the undo sequence)
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {;<CR> {<CR>};<Esc>O

" Skip over the closing character
" (also interrupts undo)
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
" Automatic closing for C-style comments
inoremap /*          /**/<Left><Left>
inoremap /*<Space>   /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>      /*<CR>*/<Esc>O
inoremap <Leader>/*  /*

" Settings for mintty
" Get block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Avoid escape timeout issues
" let &t_ti.="\e[?7727h"
" let &t_te.="\e[?7727l"
" noremap <Esc>O[ <Esc>
" noremap! <Esc>O[ <Esc>

" Enable mouse functionality
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
" else
" 	set ttymouse=xterm2
end

" " And then unbind it lol
" map <ScrollWheelUp> <nop>
" map <S-ScrollWheelUp> <nop>
" map <C-ScrollWheelUp> <nop>
" map <ScrollWheelDown> <nop>
" map <S-ScrollWheelDown> <nop>
" map <C-ScrollWheelDown> <nop>
" map <ScrollWheelLeft> <nop>
" map <S-ScrollWheelLeft> <nop>
" map <C-ScrollWheelLeft> <nop>
" map <ScrollWheelRight> <nop>
" map <S-ScrollWheelRight> <nop>
" map <C-ScrollWheelRight> <nop>

