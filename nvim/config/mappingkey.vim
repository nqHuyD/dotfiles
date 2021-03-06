"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <silent> <leader>w :tabnext<CR>
nnoremap <silent> <leader>q :tabprevious<CR>
nnoremap <silent> 1<Tab> 1gt
nnoremap <silent> 2<Tab> 2gt
nnoremap <silent> 3<Tab> 3gt

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Copy/Paste/Cut
if has('unnamedplus')
set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap XX "+x<CR>

if has('macunix')
" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
endif

"Search Visual Selected Text
vnoremap / y/<C-R>"<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

noremap <C-s>          :update<CR>
vnoremap <C-s>         <C-C>:update<CR>
inoremap <C-s>         <C-O>:update<CR>
inoremap <C-d> <esc>:q!<cr>               " save and exit
vnoremap <C-d> <esc>:q!<cr>
nnoremap <c-d> :q!<cr>

"Open Bookmark
nnoremap <Leader>bs <Esc>:Bookmark
:map ,bo :call feedkeys(":OpenBookmark \<Tab>","tn")<CR>
:map ,bc :call feedkeys(":ClearBookmarks \<Tab>","tn")<CR>

"Apply Macro
vnoremap <leader>m :normal @

"Clear HightLigh Text
nnoremap <esc> :noh<return><esc>

"Auto close Tag
inoremap ><Tab> ><Esc>?<[a-z]<CR>lyiwo</<C-r>"><Esc>O

"" New Line
nmap <CR> :a<CR><CR>.<CR>

"" Show Changes
map <leader>` <ESC>:changes<CR>

"" Check Erro
map <leader>lo :lopen<CR>

inoremap jj <esc>
tnoremap jj <C-\><C-n>

" Use CTRL-S for saving, also in Insert mode
noremap <Cmd-S> :update<CR>
vnoremap <Cmd-S> <C-C>:update<CR>
inoremap <Cmd-S> <C-O>:update<CR>

" Rainbow Indent
map <leader>si :RainbowLevelsToggle<CR>

" Pretter Format
noremap <leader>p :Prettier<CR>
