let s:veco_start = 0

function! s:veco_startup()
  if s:veco_start == 0
    return
  endif
  call ctrlp#veco#setlines(getline('1', '$'))
  silent! bw!
  call ctrlp#init(ctrlp#veco#id())
endfunction

augroup Veco
  autocmd VimEnter * call s:veco_startup()
augroup END

command! Veco let s:veco_start = 1
