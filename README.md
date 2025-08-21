# vim-singlechar

A simple Vim plugin that lets you insert single characters (including Unicode) without leaving normal mode.

## Overview

`vim-singlechar` allows you to quickly insert characters while staying in normal mode.

## Features

- Insert characters (supports Unicode) at or after the cursor position
- Support for counts to insert a character multiple times
- Stay in normal mode for efficient editing
- Minimal workflow interruption
- Works with Vim 9+
- **Supports [`vim-repeat`](https://github.com/tpope/vim-repeat) for `.` repeat functionality**

## Installation

### Manual installation

```bash
cd /tmp
git clone https://github.com/lohhiiccc/vim-singlechar.git
mkdir -p ~/.vim/pack/plugins/start/
cp -r vim-singlechar ~/.vim/pack/plugins/start/
cd -
```

### Optional: Install [vim-repeat](https://github.com/tpope/vim-repeat)

For seamless repeat (`.`) support, install [vim-repeat](https://github.com/tpope/vim-repeat):

```bash
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/repeat.git
```

## Usage

By default, the plugin provides four mappings:
> [optional param]
> (param)

> `[count]<bind>(char)`

- `[count]<Leader>i(char)` - Insert a character at the cursor position
- `[count]<Leader>a(char)` - Insert a character after the cursor position
- `[count]<Leader>I(char)` - Insert a character at the beginning of the line
- `[count]<Leader>A(char)` - Insert a character at the end of the line

After pressing the mapping, you'll see a prompt asking for the character to insert. Press any character and it will be inserted without entering insert mode.

### With count

You can use a count before the mapping to insert the character multiple times:

- `3<Leader>i,` will insert three commas at the cursor position
- `5<Leader>a.` will insert five periods after the cursor position

### Repeat last insert with `.`

If [vim-repeat](https://github.com/tpope/vim-repeat) is installed, you can repeat the last character insertion with `.` in normal mode.

## Configuration

You can customize the plugin by setting these variables in your vimrc:

```vim
" Change the mappings (before loading the plugin)
let g:singlechar_map_insert_at = '<Leader>i'    " Default
let g:singlechar_map_insert_after = '<Leader>a' " Default
let g:singlechar_map_insert_begin = '<Leader>I' " Default
let g:singlechar_map_insert_end = '<Leader>A'   " Default

" Set the static cursor (no cursor move during singlechar actions)
let g:singlechar_static_cursor = 1

" Change the prompt message
let g:singlechar_prompt = 'Press the character to insert - Press Esc to cancel...'  " Default

" Disable default mappings (if you want to create your own)
let g:singlechar_no_mappings = 1

" Show warning if more than one character is entered (default: enabled)
let g:singlechar_keylen_warning = 1

" Customize the warning message (default: 'Only the first character will be taken: {char}')
let g:singlechar_warning_message = 'Only the first character will be taken: {char}'

```

## Commands

The plugin provides these commands:

> [optional param]
> (param)

- `:InsertCharAt (count) [char]` - Insert a character at the cursor position
- `:InsertCharAfter (count) [char]` - Insert a character after the cursor position
- `:InsertCharBegin (count) [char]` - Insert a character at the beginning of the line
- `:InsertCharEnd (count) [char]` - Insert a character at the end of the line

## License

[MIT License](https://github.com/lohhiiccc/vim-singlechar/blob/main/LICENSE)
