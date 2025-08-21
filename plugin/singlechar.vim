vim9script noclear
import autoload 'singlechar.vim'
# ------------------------------------------------------------------------------ #
# singlechar.vim - Insert single characters without entering insert mode
# Author:       lohhiiccc
# Version:      1.0.0
# License:      MIT
# Repository:   https://github.com/lohhiiccc/vim-singlechar
# ------------------------------------------------------------------------------ #
# Description:
# This plugin allows you to quickly insert a single character without entering
# insert mode. Simply use the configured mapping, press the character you want
# to insert, and continue in normal mode. Supports count for repeating characters.
# ------------------------------------------------------------------------------ #

if exists('g:loaded_singlechar') || &cp || v:version < 900
    finish
endif
g:loaded_singlechar = 1
# ------------------------------------------------------------------------------ #
# Configuration options

# Mapping to insert a character at cursor position (before cursor)
if !exists('g:singlechar_map_insert_at')
  g:singlechar_map_insert_at = '<Leader>i'
endif

# Mapping to insert a character after cursor position
if !exists('g:singlechar_map_insert_after')
  g:singlechar_map_insert_after = '<Leader>a'
endif

# Mapping to insert a character at the endline
if !exists('g:singlechar_map_insert_end')
  g:singlechar_map_insert_end = '<Leader>A'
endif

# Mapping to insert a character at the startline
if !exists('g:singlechar_map_insert_begin')
  g:singlechar_map_insert_begin = '<Leader>I'
endif

# Prompt message shown when waiting for character input
if !exists('g:singlechar_prompt')
  g:singlechar_prompt = 'Press the character to insert - Press Esc to cancel...'
endif

# Enable/disable static cursor feature
if !exists('g:singlechar_static_cursor')
  g:singlechar_static_cursor = 0
endif

# toggle warning
if !exists('g:singlechar_keylen_warning')
  g:singlechar_keylen_warning = 1
endif

# warning message
if !exists('g:singlechar_warning_message')
  g:singlechar_warning_message = 'Only the first character will be taken: {char}'
endif

# ------------------------------------------------------------------------------ #
#
g:last_singlechar_key = ''
g:last_singlechar_mode = ''
g:last_singlechar_count = 1
# 
# ------------------------------------------------------------------------------ #
# Mappings <Plug>
nnoremap <Plug>(singlechar-repeat) :call g:RepeatSingleChar()<CR>

# Direct command implementations
command! -count=1 -nargs=? InsertCharBegin singlechar.InsertChar('begin', <count>, <q-args>)
command! -count=1 -nargs=? InsertCharEnd singlechar.InsertChar('end', <count>, <q-args>)
command! -count=1 -nargs=? InsertCharAt singlechar.InsertChar('at', <count>, <q-args>)
command! -count=1 -nargs=? InsertCharAfter singlechar.InsertChar('after', <count>, <q-args>)

# Create default mappings unless disabled
if !exists('g:singlechar_no_mappings')
    execute 'nnoremap <expr> <silent> ' .. g:singlechar_map_insert_at .. ' ":<C-u>InsertCharAt " .. v:count1 .. "<CR>"' 
    execute 'nnoremap <expr> <silent> ' .. g:singlechar_map_insert_after .. ' ":<C-u>InsertCharAfter " .. v:count1 .. "<CR>"'
    execute 'nnoremap <expr> <silent> ' .. g:singlechar_map_insert_begin .. ' ":<C-u>InsertCharBegin " .. v:count1 .. "<CR>"'
    execute 'nnoremap <expr> <silent> ' .. g:singlechar_map_insert_end .. ' ":<C-u>InsertCharEnd " .. v:count1 .. "<CR>"'
endif

# Usage:
# [count]<Leader>i - Insert character at cursor position
# [count]<Leader>I - Insert character at begin of the line
# [count]<Leader>a - Insert character after cursor position
# [count]<Leader>A - Insert character at end of the line
# 
# ------------------------------------------------------------------------------ #
