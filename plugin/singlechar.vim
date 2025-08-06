vim9script noclear

# singlechar.vim - Insert single characters without entering insert mode
# Author: lohhiiccc
# Version: 0.1

if exists("g:loaded_singlechar") || &cp || v:version < 900
	finish
endif
g:loaded_singlechar = 1

# Options
if !exists('g:singlechar_map_insert_at')
	g:singlechar_map_insert_at = '<Leader>i'
endif
if !exists('g:singlechar_map_insert_after')
	g:singlechar_map_insert_after = '<Leader>a'
endif

function InsertCharSilently(mode)
	const char = getchar()
	" If not <Esc>
	redraw
	if char != 27 
		if a:mode == 'at'
			execute "normal! i" .. nr2char(char) .. "\<Esc>"
		else
			execute "normal! a" .. nr2char(char) .. "\<Esc>"
		endif
	endif
	return ''
endfunction

# plugin commands
command -nargs=0 InsertCharAt InsertCharSilently('at')
command -nargs=0 InsertCharAfter InsertCharSilently('after')

# Default mapping ( g:singlechar_no_mappings to toggle it off)
if !exists('g:singlechar_no_mappings')
	execute "nnoremap <silent> " .. g:singlechar_map_insert_at .. " <ScriptCmd>echo InsertCharSilently('at')<CR>"
	execute "nnoremap <silent> " .. g:singlechar_map_insert_after .. " <ScriptCmd>echo InsertCharSilently('after')<CR>"
endif
