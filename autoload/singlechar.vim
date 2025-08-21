vim9script noclear

export def InsertChar(mode: string, count: number, input_char: string = ''): void
    var warning_message = ''
    var first_char = strcharpart(input_char, 0, 1)  # strcharpart for Unicode support

    if input_char == ''
        echo g:singlechar_prompt
        redraw

        # Get character from user
        var char = getchar()
        first_char = nr2char(char)
    elseif g:singlechar_keylen_warning == 1 && strchars(input_char) > 1
        warning_message = substitute(g:singlechar_warning_message, '{char}', first_char, '')
    endif

    if first_char ==# "\<Esc>"
        return
    endif

    var insert_command = GetInsertCommand(mode)
    var insert_text = repeat(first_char, (count == 0) ? 1 : count)

    DoSingleChar(insert_command, insert_text, g:singlechar_static_cursor)
    
    # Save last used values
    g:last_singlechar_key = first_char
    g:last_singlechar_mode = mode
    g:last_singlechar_count = count

    legacy silent! call repeat#set("\<Plug>(singlechar-repeat)")

    if warning_message != ''
        redraw!
        echomsg warning_message
    endif
enddef

def GetInsertCommand(mode: string): string
    if mode ==# 'at'
        return 'i'
    elseif mode ==# 'after'
        return 'a'
    elseif mode ==# 'begin'
        return 'I'
    elseif mode ==# 'end'
        return 'A'
    else
        return 'i'
    endif
enddef

def DoSingleChar(command: string, text: string, resetCursor: number): void
    var pos = getpos('.')
    execute 'normal! ' .. command .. text .. "\<Esc>"
    if resetCursor == 1
        if (command ==# 'i')
            pos[2] = pos[2] + 1
        endif
        setpos('.', pos)
    endif
enddef

def g:RepeatSingleChar(): void
    if g:last_singlechar_key != ''
        call InsertChar(g:last_singlechar_mode, g:last_singlechar_count, g:last_singlechar_key)
    endif
enddef
