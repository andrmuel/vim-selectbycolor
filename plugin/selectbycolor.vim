" selectbycolor.vim - select lines by color
" Maintainer:   Andreas Müller <http://0x7.ch>
" Version:      0.1
" 
" this plugin was adapted from Vim Tip #1269:
" http://vim.wikia.com/wiki/Indent_text_object

if exists('g:loaded_selectbycolor') || &cp
  finish
endif
let g:loaded_selectbycolor = 1

onoremap <silent>ac :<C-u>call <SID>ColorTxtObj(0)<CR>
onoremap <silent>ic :<C-u>call <SID>ColorTxtObj(1)<CR>
vnoremap <silent>ac <Esc>:call <SID>ColorTxtObj(0)<CR><Esc>gv
vnoremap <silent>ic <Esc>:call <SID>ColorTxtObj(1)<CR><Esc>gv

function! s:ColorTxtObj(inner)
	let l:curline = line(".")
	let l:curcol = col(".")
	let l:lastline = line("$")
	let l:color = synIDattr(synIDtrans(synID(line("."), col("."), 1)), "fg")

	let l:p = line(".") - 1
	let l:nextSynID = synIDattr(synIDtrans(synID(l:p, min([curcol, len(getline(l:p))]), 1)), "fg")
	while l:p > 0 && l:nextSynID == l:color
		-
		let l:p = line(".") - 1
		let l:nextSynID = synIDattr(synIDtrans(synID(l:p, min([curcol, len(getline(l:p))]), 1)), "fg")
	endwhile
	if (!a:inner && l:p > 0)
		-
	endif

	normal! 0V
	call cursor(curline, 0)
	let l:p = line(".") + 1
	let l:nextSynID = synIDattr(synIDtrans(synID(l:p, min([l:curcol, len(getline(l:p))]), 1)), "fg")
	while l:p <= l:lastline && l:nextSynID == l:color
		+
		let l:p = line(".") + 1
		let l:nextSynID = synIDattr(synIDtrans(synID(l:p, min([l:curcol, len(getline(l:p))]), 1)), "fg")
	endwhile
	if (!a:inner && l:p <= l:lastline)
		+
	endif
	normal! $
endfunction 
