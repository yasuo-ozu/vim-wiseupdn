if !exists('g:loaded_wiseupdn')
	finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! wiseupdn#DoMove(direction)
	let pos = getpos('.')
	let ln = pos[1]
	let s = getline('.')
	let c = pos[2] - 1
	let nln = ln + a:direction
	let lln = line('$')
	if nln < 1 || nln > lln
		return
	endif
	let ns = getline(nln)
	if strlen(ns) <= c
		let c = strlen(ns) - 1
	endif
	let i = 0
	while i <= c && s[i] == ns[i]
		let i = i + 1
	endwhile
	if i == 0
		let pos[1] = nln
		call setpos('.', pos)
		return
	endif
	let ss = strpart(s, 0, i)
	while stridx(getline(ln), ss) == 0
		if ln + a:direction < 1 || ln + a:direction > lln
			break
		endif
		let ln = ln + a:direction
	endwhile
	let pos[1] = ln
	call setpos('.', pos)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
