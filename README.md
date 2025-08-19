# vim-singlechar

A simple Vim plugin that lets you insert single characters without leaving normal mode.

## Overview

`vim-singlechar` allows you to quickly insert characters while staying in normal mode.

## Features

- Insert characters at or after the cursor position
- Support for counts to insert a character multiple times
- Stay in normal mode for efficient editing
- Minimal workflow interruption
- Works with Vim 9+

## Installation

### Manual installation

```bash
cd /tmp
git clone https://github.com/lohhiiccc/vim-singlechar.git
mkdir -p ~/.vim/pack/plugins/start/
cp -r vim-singlechar ~/.vim/pack/plugins/start/
cd -
```

## Usage

By default, the plugin provides two mappings:

- `<Leader>i` - Insert a character at the cursor position
- `<Leader>a` - Insert a character after the cursor position

After pressing the mapping, you'll see a prompt asking for the character to insert. Press any character and it will be inserted without entering insert mode.

### With count

You can use a count before the mapping to insert the character multiple times:

- `3<Leader>i,` will insert three commas at the cursor position
- `5<Leader>a.` will insert five periods after the cursor position

## Configuration

You can customize the plugin by setting these variables in your vimrc:

```vim
" Change the mappings (before loading the plugin)
let g:singlechar_map_insert_at = '<Leader>i'     " Default
let g:singlechar_map_insert_after = '<Leader>a'  " Default

" Change the prompt message
let g:singlechar_prompt = 'Press the character to insert - Press Esc to cancel...'  " Default

" Disable default mappings (if you want to create your own)
let g:singlechar_no_mappings = 1
```

## Commands

The plugin provides these commands:

- `:InsertCharAt [count]` - Insert a character at the cursor position
- `:InsertCharAfter [count]` - Insert a character after the cursor position

## License

MIT License
