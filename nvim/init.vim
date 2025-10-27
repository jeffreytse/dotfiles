" (Neo)Vim Configuration
"
" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
"
" This is JeffreyTse's vimrc.
"
" Email: jeffretse.mail@gmail.com


"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Basic settings.
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

let $VIMCONFIG = $HOME . "/.config/nvim"

if version >= 604
  set helplang=en
  set encoding=utf-8
endif

syntax on               " syntax highlighting

" Enable file type detection
filetype on
" Enable loading the plugin files for specific file types
filetype plugin on

filetype plugin indent on

" Enable mouse, using mouse to resize: splits in vim
set mouse=a

set nocompatible
set nobackup
set nowritebackup       " only in case you don't want a backup file while editing
set noswapfile          " no swap files
"set nowrap

" Show linenumbers
set number              " display line number
set numberwidth=5
"set relativenumber

" Make it obvious where 80 characters is
"set cc=80              " Set a column limit line
set textwidth=80
set colorcolumn=+1

set wildmenu            " Wild match in command mode
set hidden              " If hidden not set, TextEdit might fail.
set cmdheight=2         " Better display for messages
set updatetime=300      " Smaller updatetime for CursorHold & CursorHoldI
set signcolumn=yes      " always show signcolumns

set fileformat=unix
set showmatch           " Show matched pairs
set cursorline          " Highlight cursor line
set hlsearch            " Highlight all search results
set showcmd             " Display incomplete commands
set confirm             " Need confrimation while exit
set ruler               " Show the cursor position all the time
set autoread            " Automatically :read
set autowrite           " Automatically :write before running commands
set noswapfile          " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set fileencodings=utf-8,gb18030,gbk,big5

" Indent
set cindent             " C style indentation
set autoindent          " Minimal automatic indenting for any filetype.
set smartindent

" Set Proper Tabs
" Softtabs, 2 spaces
set expandtab           " Use space to replace tab
set shiftround
set tabstop=2
set shiftwidth=2
set softtabstop=2       " the quantity of backspaces are deleted

" Searching
set incsearch           " Do incremental searching(Realting seaching)
set ignorecase          " Ignore case in searching
set smartcase           " Don't ignore case if input includes upper case
set history=50

set laststatus=2        " Always display the status line
set backspace=2         " Backspace deletes like most programs in insert mode
" OSX stupid backspace fix
" set backspace=indent,eol,start

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Folding
set foldenable
set foldmethod=marker   " Enable folding (shortcut za)

" Enable folding with the spacebar
"nnoremap <space> za

" Enable use system clipboard instead of vim clipboard
"set clipboard=unnamed

" Leader
let mapleader = ' '

" .sh file
function HeaderBash()
  call setline(1, "#!/usr/bin/env bash")
  normal G
  normal o
endf
autocmd bufnewfile *.sh call HeaderBash()

" Switch buffer
nmap gb :bnext<cr>
nmap gB :bprev<cr>
"nmap gbf :bfirst<cr>
"nmap gbl :blast<cr>

" Add shortcut for clipboard registers
noremap <leader>p "+p
noremap <leader>y "+y
noremap <leader>d "+d

" Add shortcut for saving file
noremap <leader>fs :w<cr>
noremap <leader>fS :wa<cr>
noremap <leader>fe :qa<cr>
noremap <leader>fE :wqa<cr>

" Add undo only pane funcion
nnoremap <C-w>o :mksession! ~/session.vim<cr>:wincmd o<cr>
nnoremap <C-w>u :source ~/session.vim<cr>

" Jump to end of line while in Insert Mode
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Convert unicode escape sequences (i.e. \uXXXX) to a single character
nnoremap <silent> <leader>fnc :%s/\\u\(\x\{4\}\)/\=nr2char('0x'.submatch(1),1)/g<CR>
" Format file to utf-8[unix] style
nnoremap <silent> <leader>fnx :set encoding=utf-8 fileformat=unix<CR>
" Format file to whitespaces indent style
nnoremap <silent> <leader>fns :%!expand -t2<CR>
" Format file to remove all trailing whitespaces
nnoremap <silent> <leader>fnt :%s/\s\+$//e<CR>

" Edit vimrc configuration file
nnoremap <leader>ve :e $MYVIMRC<CR>
" Reload vimrc configuration file
nnoremap <leader>vr :source $MYVIMRC<CR>

" Translator
nnoremap <leader>tw viW:TranslateW<CR>
vnoremap <leader>tw :TranslateW<CR>
vnoremap <leader>tt :Translate<CR>

" Plugin vim-polyglot settings.
let g:polyglot_disabled = ['markdown']

" START Vim-Plugin Configuration.
call plug#begin($VIMCONFIG . '/plugged')

" --- Utility ---
Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimfiler.vim'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'simeji/winresizer'
Plug 'liuchengxu/vim-which-key'         " Shows keybindings in popup
Plug 'tpope/vim-scriptease'             " Shows keybindings in popup
Plug 'sheerun/vim-polyglot'             " Languages highlight

" Quick Access
Plug 'MattesGroeger/vim-bookmarks'
Plug 'andymass/vim-matchup'             " Navigate and highlight matching pairs, replace %

" Format
Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'editorconfig/editorconfig-vim'

" Syntax
Plug 'neoclide/jsonc.vim'

" Other
Plug 'Shougo/context_filetype.vim'

" --- Generic Programming Support ---
" Plug 'neomake/neomake'                  " Syntax / Lint
Plug 'thinca/vim-quickrun'
Plug 'AndrewRadev/sideways.vim'         " Switch Params position
Plug 'AndrewRadev/splitjoin.vim'        " Simplifies the transition between multiline and single-line code
Plug 'AndrewRadev/switch.vim'           " Switch segments of text
Plug 'tyru/caw.vim'                     " Quick Comment
Plug 'tpope/vim-speeddating'            " Use CTRL-A/CTRL-X to increment dates, times, and more
Plug 'KabbAmine/vCoolor.vim'            " Simple color selector/picker plugin for Vim
Plug 'kkoomen/vim-doge'                 " Generate proper code documentation skeletons with a single keypress
Plug 'OrangeT/vim-csharp'               " Support for CSharp files
Plug 'vim-test/vim-test'                " Support running tests
Plug 'ap/vim-css-color'                 " Display css colors in their color

" Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-sandwich'

"-- Copilot ---
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'

" --- Markdown / Writting ---
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'dhruvasagar/vim-table-mode'

" UML
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

" --- Git Support ---
"Plug 'cohama/agit.vim'
Plug 'lambdalisue/gina.vim'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'

" --- Theme / Interface ---
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'NLKNguyen/papercolor-theme'              " Vim theme
" Plug 'altercation/vim-colors-solarized'      " Vim theme
" Plug 'dracula/vim', {'as': 'dracula'}          " Vim theme
" Plug 'itchyny/vim-cursorword'
Plug 'machakann/vim-highlightedyank'
Plug 'jszakmeister/vim-togglecursor'
Plug 'rhysd/try-colorscheme.vim'

Plug 'thinca/vim-themis'
Plug 'jszakmeister/vim-togglecursor'

" --- Build / Debug ---
Plug 'puremourning/vimspector'

" --- Others ---
Plug 'ianding1/leetcode.vim'
Plug 'voldikss/vim-translator'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""
" Plugins configurationn
"""""""""""""""""""""""""""""""""""""

" Plugin startify settings.
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
nmap <leader>ww :Startify<cr>
" autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

" Plugin CompleteParameter settings.
"inoremap <silent><expr> (complete_parameter#pre_complete("()"))
smap <C-j> <Plug>(complete_parameter#goto_next_parameter)
imap <C-j> <Plug>(complete_parameter#goto_next_parameter)
smap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-k> <Plug>(complete_parameter#goto_previous_parameter)

" Plugin VimFiler settings.
" nmap <leader>we :VimFilerExplorer<cr>
" set fillchars=vert:│,fold:─
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_safe_mode_by_default = 0
" let g:vimfiler_enable_auto_cd = 1
" let g:vimfiler_tree_indentation = 2
" let g:vimfiler_tree_leaf_icon = ""
" let g:vimfiler_tree_opened_icon = ""
" let g:vimfiler_tree_closed_icon = ""

function! s:vimfiler_settings()
  nmap <buffer><expr> t vimfiler#do_action('tabopen')
endfunction
autocmd FileType vimfiler call <SID>vimfiler_settings()

" Plugin tagbar settings.
nmap <leader>wt :TagbarToggle<cr>
let g:tagbar_width = 25
let g:tagbar_autofocus = 1

" Plugin undotree settings.
nmap <leader>wu :UndotreeToggle<cr>

" Plugin autoformat settings.
noremap <leader>af :Autoformat<cr>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1

" Plugin coc.nvim settings.
let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-lists',
      \ 'coc-emmet',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-xml',
      \ 'coc-wxml',
      \ 'coc-sql',
      \ 'coc-lua',
      \ 'coc-go',
      \ 'coc-java',
      \ 'coc-java-debug',
      \ 'coc-omnisharp',
      \ 'coc-rls',
      \ 'coc-rust-analyzer',
      \ 'coc-tag',
      \ 'coc-word',
      \ 'coc-emoji',
      \ 'coc-vetur',
      \ 'coc-tsserver',
      \ 'coc-solargraph',
      \ 'coc-snippets',
      \ 'coc-ultisnips',
      \ 'coc-prettier',
      \ 'coc-import-cost',
      \ 'coc-pairs',
      \ 'coc-vimlsp',
      \ 'coc-phpls',
      \ 'coc-powershell',
      \ 'coc-groovy',
      \ 'coc-yank',
      \ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-tslint-plugin',
      \ 'coc-stylelint',
      \ 'coc-markdownlint',
      \ 'coc-highlight',
      \ 'coc-tabnine',
      \ 'coc-calc',
      \ 'coc-dictionary',
      \ 'coc-explorer',
      \ 'coc-cssmodules',
      \ 'coc-pyright',
      \ 'coc-spell-checker',
      \ '@yaegassy/coc-tailwindcss3'
      \ ]

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-l> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<cr>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"


" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd ColorScheme *
      \ hi CocHighlightText ctermbg=242 guibg=#404040
      \ | hi CocErrorHighlight guibg=#802020
      \ | hi CocWarningHighlight guibg=#806022
      \ | hi CocInfoHighlight guibg=#806022
      \ | hi CocHintHighlight guibg=#224290
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Show extension list
nnoremap <leader>le :CocList extensions<cr>
" Show symbols of current buffer
nnoremap <leader>lo :CocList symbols<cr>
" Show diagnostics of current workspace
nnoremap <leader>ld :CocList diagnostics<cr>
" Show available commands
nnoremap <leader>lc :CocList commands<cr>
" Show available services
nnoremap <leader>ls :CocList services<cr>
" Show links of current buffer
nnoremap <leader>ll :CocList links<cr>

nnoremap <leader>lb :CocList buffers<cr>
nnoremap <leader>lw :CocList words<cr>
nnoremap <leader>lg :CocList grep<cr>
nnoremap <leader>lr :CocListResume<cr>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl <Plug>(coc-codelens-action)

" Quick Format
nmap <leader>cf <Plug>(coc-format)

" Formatting selected code
xmap <leader>cff <Plug>(coc-format-selected)
nmap <leader>cff <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current buffer
nmap <leader>cca <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line
nmap <leader>cqf <Plug>(coc-fix-current)

" Finding
nmap <leader>fa :CocSearch -S -e<space>
nmap <leader>fg <Cmd>CocList -I grep -i<cr>
nmap <leader>fG <Cmd>CocList -I grep -regex<cr>

" ctrl-p
nmap <C-p> :CocList files<cr>

" Jump to float window, the same as `ctrl-w w`
nmap <leader>jf <Plug>(coc-float-jump)

" Navigate projects when using coc.nvim
autocmd BufEnter * :call SetVimtestProjectRoot(expand('%:p'))
function! SetVimtestProjectRoot(file)
  if exists("g:WorkspaceFolders")
    for f in g:WorkspaceFolders
      if match(a:file, f, 0) == 0 | let g:test#project_root = f | return | endif
    endfor
  endif
endfunction

" Setup Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Setup coc-explorer
nmap ge :CocCommand explorer<cr>


" Plugin winresizer settings.
let g:winresizer_vert_resize = 5

" Plugin vim-highlightyank settings.
let g:highlightedyank_highlight_duration = 100

" Plugin indentLine settings.
let g:indentLine_char = "┆"
let g:indentLine_enabled = 1
let g:autopep8_disable_show_diff = 1
let g:indentLine_fileTypeExclude = [
    \  '',
    \  'defx',
    \  'json',
    \  'vimfiler',
    \  'unite',
    \  'tagbar',
    \  'gina-status',
    \  'gina-grep',
    \  'gina-branch',
    \]
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = ''
let g:indentLine_faster = 1

" Plugin airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline_theme = 'papercolor'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Plugin ultisnps settings.

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Plugin syntastic settings.
nnoremap <leader>wh :Errors<cr>
nnoremap <leader>wH :SyntasticToggleMode<cr> :SyntasticCheck<cr>
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd Syntax javascript set syntax=jquery " JQuery syntax support

set matchpairs+=<:>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
" let g:syntastic_auto_jump = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetypes': []}
" Use pylint to check python files.
let g:syntastic_python_checkers = ['pylint']
" Use pylint to check php files.
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
" Ignore warnings about newlines trailing.
let g:syntastic_quiet_messages = { 'regex': ['trailing-newlines', 'invalid-name',
    \'too-many-lines', 'too-many-instance-attributes', 'too-many-public-methods',
    \'too-many-locals', 'too-many-branches'] }

" Plugin vim-easy-align settings.
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plugin gina settings.
nmap <leader>gs :Gina status<cr>
nmap <leader>gl :Gina pull<cr>
nmap <leader>gp :Gina push<cr>
nmap <leader>gc :Gina commit<cr>

" Plugin blamer settings.
nmap <leader>gb :BlamerToggle<CR>

" Plugin sideways settings.
nnoremap <C-h> :SidewaysLeft<cr>
nnoremap <C-l> :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" Plugin WhichKey settings.
nnoremap <silent> <leader> :WhichKey '<space>'<cr>

" Plugin switch settings.
let g:switch_mapping = "<leader>s"

" Plugin QuickRun settings.
map <leader>rr :QuickRun<cr>

" Plugin jsonc settings.
autocmd BufNewFile,BufRead tsconfig.json setlocal filetype=jsonc


" Plugin matchup settings.
let g:matchup_matchparen_deferred = 1

" Plugin devicons settings.
let g:webdevicons_enable = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:airline_powerline_fonts = 1
let g:WebDevIconsOS = 'Darwin'

" Plugin vim-bookmarks settings.
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE

" Plugin vimspector settings.
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Plugin vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" Plugin leetcode
let g:leetcode_browser = 'chrome'
let g:leetcode_solution_filetype = 'python3'

" Plugin copilot-chat settings.
nmap <silent> <leader><leader>p :CopilotChatToggle<CR>
vmap <silent> <leader><leader>p :CopilotChat<CR>
map <silent> <leader><leader>x :CopilotChatClose<CR>
map <silent> <leader><leader>s :CopilotChatStop<CR>
map <silent> <leader><leader>r :CopilotChatReset<CR>
map <silent> <leader><leader>f :CopilotChatFix<CR>
map <silent> <leader><leader>F :CopilotChatFixDiagnostic<CR>
map <silent> <leader><leader>e :CopilotChatExplain<CR>
map <silent> <leader><leader>v :CopilotChatReview<CR>
map <silent> <leader><leader>o :CopilotChatOptimize<CR>
map <silent> <leader><leader>c :CopilotChatCommit<CR>
map <silent> <leader><leader>d :CopilotChatDocs<CR>
map <silent> <leader><leader>t :CopilotChatTests<CR>

" syntax highlight
syntax enable

" Enable terminal support true color
if has("termguicolors")
  " Set Vim-specific sequences for RGB colors, fix bug for vim
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Vim theme
set background=dark
colorscheme PaperColor

" Vim split bar styling
" set fillchars+=vert:│
hi VertSplit guifg=darkgray guibg=NONE gui=none
      \ ctermfg=darkgray ctermbg=none term=none cterm=none

lua require('init')
