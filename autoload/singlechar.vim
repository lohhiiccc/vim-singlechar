vim9script noclear
 
# Function to handle character insertion
# Parameters:
#   mode:  'at' to insert before cursor, 'after' to insert after cursor
#   count: number of times to repeat the character
#   pkey: character to insert (optional)
export def InsertChar(mode: string, count: number, pkey: string = ''): void

    var key = pkey
    if pkey == ''
        echo g:singlechar_prompt
        redraw

        # Get character from user
        var char = getchar()
        key = nr2char(char)
    endif
    if key ==# "\<Esc>"
        return
    endif
    
    # Determine whether to insert before (i) or after (a) cursor
    var cmd = (mode ==# 'at') ? 'i' : 'a'
    var text = repeat(key, count)

    execute 'normal! ' .. cmd .. text .. "\<Esc>"
    #save
    g:last_singlechar_key = key
    g:last_singlechar_mode = mode
    g:last_singlechar_count = count

    #set vim-repeat
    #if exists('*repeat#set')
        legacy silent! call repeat#set("\<Plug>(singlechar-repeat)")
    #endif
enddef

def g:RepeatSingleChar(): void
    if g:last_singlechar_key != ''
        call InsertChar(g:last_singlechar_mode, g:last_singlechar_count, g:last_singlechar_key)
    endif
enddef
