"IMPORTANT - Autosaves on every file update
autocmd TextChanged,TextChangedI * update

if exists("current_compiler")
  finish
endif

let current_compiler = "starknet-compile"

setlocal makeprg=starknet-compile\ %*

"TagBar
let g:tagbar_type_cairo = {
    \ 'ctagstype': 'cairo',
    \ 'kinds' : [
        \ 'x:Structs',
        \ 'e:Events',
        \ 's:Storage Vars',
        \ 'c:Constructor',
        \ 'v:View Functions',
        \ 'f:External Functions',
        \ 'r:Errors',
    \ ]
\ }

" tagbar
autocmd VimEnter * nested :TagbarOpen

highlight TagbarKind guifg=#95C561 
highlight TagbarHighlight guibg=#4A5057
highlight TagbarTagLineN guifg=#EEEE6D

let g:tagbar_show_tag_count=1
let g:tagbar_compact=2
let g:tagbar_iconchars = ['≡ ', '≡ '] 
let g:tagbar_indent=2

" formatter

function! CairoFormat()
  silent !clear
  silent execute "!cairo-format -i " . bufname('%') | execute ':redraw!'
endfunction

command! CairoFormat :call CairoFormat()

nnoremap <C-y> :call CairoFormat() <CR>

let g:ale_cache_executable_check_failures = v:null
let g:ale_command_wrapper = ''
let g:ale_completion_delay = v:null
let g:ale_lint_delay=0
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = '■'
let g:ale_echo_msg_format = "[%linter%] %s (%code%)"
let g:ale_echo_msg_info_str = '💡'
let g:ale_echo_msg_warning_str = '■'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_list_window_size = 10
let g:ale_loclist_msg_format = '[%linter%] %s (%code%)'
let g:ale_max_buffer_history_size = 20
let g:ale_max_signs = -1
let g:ale_open_list = 1
let g:ale_pattern_options = v:null
let g:ale_pattern_options_enabled = v:null
let g:ale_set_balloons = 1
let g:ale_set_highlights = 1
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_offset = 1000000
let g:ale_sign_error = '■'
let g:ale_sign_info = '💡'
let g:ale_sign_warning = '■'
let g:ale_use_global_executables = v:null
let g:ale_virtualtext_cursor = 1
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1

"go to next lint error/warning
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"vim's omnicomplete using <C-n> <C-p>
set wildmode=longest,list
set wildmenu

"close if only quickfix and nerdtree are open
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction

let g:ale_linters = {
\  'cairo': ['starknet'],
\}

