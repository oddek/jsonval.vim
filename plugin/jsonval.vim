" Vim JSON validator
" Last change 2021 Mar 16
" Maintainer: Kent Odde <kentodde89@gmail.com>
" Licence: MIT

if exists("b:loaded_jsonval")
  finish
endif
let b:loaded_jsonval = 1

if !exists("*s:jsonval")
  function s:Jsonval()
    let s:filename = expand("%")
	let s:cmd = "cat " . s:filename . " | jq -e >> /dev/null"
	" let s:result =
	if system(s:cmd) == ''
		echo "Valid JSON"
	else
		echo "NOT Valid JSON"
	endif
  endfunction
endif

if !exists(":jsonval")
  command Jsonval call s:Jsonval()
endif
