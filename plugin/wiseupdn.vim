if exists('g:loaded_wiseupdn')
	finish
endif

let g:loaded_wiseupdn = 1

let s:save_cpo = &cpo
set cpo&vim

let s:wiseupdn_keymap = get(g:, 'wiseupdn_use_defaultkeymap', 1)

if s:wiseupdn_keymap
	nnoremap <silent> <C-j> :call wiseupdn#DoMove(1)<CR>
	nnoremap <silent> <C-k> :call wiseupdn#DoMove(-1)<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo
