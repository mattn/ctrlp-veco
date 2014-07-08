if exists('g:loaded_ctrlp_veco') && g:loaded_ctrlp_veco
  finish
endif
let g:loaded_ctrlp_veco = 1

let s:veco_var = {
\  'init':   'ctrlp#veco#init()',
\  'exit':   'ctrlp#veco#exit()',
\  'accept': 'ctrlp#veco#accept',
\  'lname':  'veco',
\  'sname':  'veco',
\  'type':   'path',
\  'sort':   0,
\  'nolim':   1,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:veco_var)
else
  let g:ctrlp_ext_vars = [s:veco_var]
endif

let s:lines = []

function! ctrlp#veco#setlines(lines)
  let s:lines = a:lines
endfunction

function! ctrlp#veco#init(...)
  return s:lines
endfunc

function! ctrlp#veco#exit()
  cquit!
endfunction

function! ctrlp#veco#accept(mode, str)
  call writefile(split(a:str, "\n"), $VECO_FILE)
  qall!
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#veco#id()
  return s:id
endfunction

" vim:fen:fdl=0:ts=2:sw=2:sts=2
