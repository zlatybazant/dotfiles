"Plugins
"call plug#begin()
"Plug 'vimwiki/vimwiki'
"call plug#end()

" File browsing
let g:netrw_banner=0            " disable annoying banner
let g:netrw_browse_split=4      " open in prior window
let g:netrw_altv=1              " open splits to the right
let g:netrw_liststyle=3         " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


" SETs for universal enviroment
set noswapfile
set relativenumber
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"set autoindent		
set number
set showcmd
set wildmenu
set nocompatible "for VimWiki"
set paste

" Finding files
set path+=**
set wildmenu
syntax enable
filetype plugin on

" Outfit
colorscheme elflord
if has('filetype')
    filetype indent plugin on
endif
if has('syntax')
   syntax on
endif

" Tabs config by FileType
augroup FileTypeSpecificAutocommands
    autocmd FileType robot setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile *.robot r ~/.vim/skeleton.robot
augroup END

" Mappings for quick vim tab-jumps
"noremap <C>q 1gt
"noremap <C>w 2gt
"noremap <C>e 3gt
"noremap <C>r 4gt
noremap H gT
noremap L gt
