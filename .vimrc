"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" add relative line numbers
set relativenumber

" make sure the cursor is always in the center of the screen if possible
" (workaround for "set scrolloff=999")
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

" add line number and orientation of where you are on the bottom right (e.g.
" aine 270 and 36% down the document)
set scrolloff=5
set ruler

" show a menu with all the optional commands when running :<Tab>
set wildmenu

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" highlight all matching phrases 
set hlsearch

" show partial matches for a search phrase
set incsearch

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif


" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" To switch off a feature prepend it with no, e.g. "set nornu"

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 5 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=5
set softtabstop=5
set expandtab

" Allo usage of shift tab to invert tab
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>


"------------------------------------------------------------
" Packages Section
"


"------------------------------------------------------------
" Plugin Section
" We are using vim-plug which can be installed from (https://github.com/junegunn/vim-plug)
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

call plug#end()

"------------------------------------------------------------
"Custom Mappings

" Map \p to add round brackets around a word
:map \p i(<Esc>ea)<Esc>
" Map \c to add curly brackets around a word
:map \c i{<Esc>ea}<Esc>
