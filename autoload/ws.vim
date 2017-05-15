function! ws#Enter()
	"set tab stop to 1 and disable all indent
	let b:ws_ft_old_ts = &l:ts
	let b:ws_ft_old_ai = &l:ai
	let b:ws_ft_old_cin = &l:cin
	let b:ws_ft_old_si = &l:si
	let b:ws_ft_old_inde = &l:inde
	let &l:ts = 1
	let &l:ai = 0
	let &l:cin = 0
	let &l:si = 0
	let &l:inde = ""
	augroup WSFileType
		autocmd!
		autocmd FileType <buffer> call ws#Leave()
	augroup END
endfunction

function! ws#Leave()
	"restore tab stop and indent
	let &l:ts = b:ws_ft_old_ts
	let &l:ai = b:ws_ft_old_ai
	let &l:cin = b:ws_ft_old_cin
	let &l:si = b:ws_ft_old_si
	let &l:inde = b:ws_ft_old_inde
	augroup WSFileType
		autocmd!
	augroup END
endfunction
