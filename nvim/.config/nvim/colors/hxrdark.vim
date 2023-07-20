" Vim color file
" Maintainer: Martin Baeuml <baeuml@gmail.com>
" Last Change: 2008-02-09
"
" This color file is a modification of the "summerfruit" color scheme by Armin Ronacher
" so that it can be used on 88- and 256-color xterms. The colors are translated
" using Henry So's programmatic approximation of gui colors from his "desert256"
" color scheme.
"
" I removed the "italic" option and the background color from
" comment-coloring because that looks odd on my console.
"
" The original "summerfruit" color scheme and "desert256" are available from vim.org.

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let colors_name="hxr"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
    " functions {{{
    " returns an approximate grey index for the given grey level
    fun <SID>grey_number(x)
        if &t_Co == 88
            if a:x < 23
                return 0
            elseif a:x < 69
                return 1
            elseif a:x < 103
                return 2
            elseif a:x < 127
                return 3
            elseif a:x < 150
                return 4
            elseif a:x < 173
                return 5
            elseif a:x < 196
                return 6
            elseif a:x < 219
                return 7
            elseif a:x < 243
                return 8
            else
                return 9
            endif
        else
            if a:x < 14
                return 0
            else
                let l:n = (a:x - 8) / 10
                let l:m = (a:x - 8) % 10
                if l:m < 5
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual grey level represented by the grey index
    fun <SID>grey_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 46
            elseif a:n == 2
                return 92
            elseif a:n == 3
                return 115
            elseif a:n == 4
                return 139
            elseif a:n == 5
                return 162
            elseif a:n == 6
                return 185
            elseif a:n == 7
                return 208
            elseif a:n == 8
                return 231
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 8 + (a:n * 10)
            endif
        endif
    endfun

    " returns the palette index for the given grey index
    fun <SID>grey_color(n)
        if &t_Co == 88
            if a:n == 0
                return 16
            elseif a:n == 9
                return 79
            else
                return 79 + a:n
            endif
        else
            if a:n == 0
                return 16
            elseif a:n == 25
                return 231
            else
                return 231 + a:n
            endif
        endif
    endfun

    " returns an approximate color index for the given color level
    fun <SID>rgb_number(x)
        if &t_Co == 88
            if a:x < 69
                return 0
            elseif a:x < 172
                return 1
            elseif a:x < 230
                return 2
            else
                return 3
            endif
        else
            if a:x < 75
                return 0
            else
                let l:n = (a:x - 55) / 40
                let l:m = (a:x - 55) % 40
                if l:m < 20
                    return l:n
                else
                    return l:n + 1
                endif
            endif
        endif
    endfun

    " returns the actual color level for the given color index
    fun <SID>rgb_level(n)
        if &t_Co == 88
            if a:n == 0
                return 0
            elseif a:n == 1
                return 139
            elseif a:n == 2
                return 205
            else
                return 255
            endif
        else
            if a:n == 0
                return 0
            else
                return 55 + (a:n * 40)
            endif
        endif
    endfun

    " returns the palette index for the given R/G/B color indices
    fun <SID>rgb_color(x, y, z)
        if &t_Co == 88
            return 16 + (a:x * 16) + (a:y * 4) + a:z
        else
            return 16 + (a:x * 36) + (a:y * 6) + a:z
        endif
    endfun

    " returns the palette index to approximate the given R/G/B color levels
    fun <SID>color(r, g, b)
        " get the closest grey
        let l:gx = <SID>grey_number(a:r)
        let l:gy = <SID>grey_number(a:g)
        let l:gz = <SID>grey_number(a:b)

        " get the closest color
        let l:x = <SID>rgb_number(a:r)
        let l:y = <SID>rgb_number(a:g)
        let l:z = <SID>rgb_number(a:b)

        if l:gx == l:gy && l:gy == l:gz
            " there are two possibilities
            let l:dgr = <SID>grey_level(l:gx) - a:r
            let l:dgg = <SID>grey_level(l:gy) - a:g
            let l:dgb = <SID>grey_level(l:gz) - a:b
            let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
            let l:dr = <SID>rgb_level(l:gx) - a:r
            let l:dg = <SID>rgb_level(l:gy) - a:g
            let l:db = <SID>rgb_level(l:gz) - a:b
            let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
            if l:dgrey < l:drgb
                " use the grey
                return <SID>grey_color(l:gx)
            else
                " use the color
                return <SID>rgb_color(l:x, l:y, l:z)
            endif
        else
            " only one possibility
            return <SID>rgb_color(l:x, l:y, l:z)
        endif
    endfun

    " returns the palette index to approximate the 'rrggbb' hex string
    fun <SID>rgb(rgb)
        let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
        let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
        let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

        return <SID>color(l:r, l:g, l:b)
    endfun

    " sets the highlighting for the given group
    fun <SID>X(group, fg, bg, attr)
        if a:fg != ""
            exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
        endif
        if a:bg != ""
            exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
        endif
        if a:attr != ""
            exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
        endif
    endfun
    " }}}

    " Global
	call <SID>X("Normal", "ffffff", "000000", "")
	"call <SID>X("NonText", "aaaaaa", "000000", "") " after the end of a file.

    "" Search
    "call <SID>X("Search", "000000", "ffff00", "")
    "call <SID>X("IncSearch", "000000", "ffff00", "")

    "" Interface Elements
    "call <SID>X("StatusLine", "000000", "43c464", "bold")
    "call <SID>X("StatusLineNC", "9bd4a9", "51b069", "")
    "call <SID>X("VertSplit", "000000", "ffffff", "")
    "call <SID>X("Folded", "ffffff", "333333", "")
    "call <SID>X("IncSearch", "ffff00", "000000", "")
    "call <SID>X("Pmenu", "000000", "cb2f27", "")
    "call <SID>X("SignColumn", "", "", "")
    "call <SID>X("CursorLine", "", "333366", "")
    "call <SID>X("LineNr", "4488cc", "000000", "")
    "call <SID>X("MatchParen", "", "", "")
    "call <SID>X("Visual", "333333", "eeeeee", "")

    "" Specials
    "call <SID>X("Todo", "ffffff", "ff0000", "bold")
    "call <SID>X("Title", "ffffff", "", "")
    "call <SID>X("Special", "ffffff", "", "")
    "call <SID>X("SpecialKey", "eeeeee", "333333", "") " tab

""hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE guifg=#64645e guibg=#64645e gui=NONE

    "" Syntax Elements
    "call <SID>X("String", "ffffff", "", "")
    "call <SID>X("Constant", "00ffff", "", "")
    "call <SID>X("Number", "ff88ff", "", "")
    "call <SID>X("Statement", "ffffff", "", "")
    "call <SID>X("Function", "ff88ff", "", "")
    "call <SID>X("PreProc", "ffffff", "", "")
    "call <SID>X("Comment", "00ff00", "", "bold")
    "call <SID>X("Type", "ffffff", "", "")
    "call <SID>X("Error", "000000", "33ffff", "")
    "call <SID>X("Identifier", "ffffff", "", "")
    "call <SID>X("Label", "ffffff", "", "")

hi Character       guifg=#C5A3FF guibg=None guisp=None gui=bold ctermfg=183 ctermbg=None cterm=bold
hi Comment         guifg=#BFBFBF guibg=None guisp=None gui=None ctermfg=07 ctermbg=None cterm=None
hi Constant        guifg=#C5A3FF guibg=None guisp=None gui=bold ctermfg=183 ctermbg=None cterm=bold
hi Cursor          guifg=None guibg=#F8F8F0 guisp=None gui=None ctermfg=None ctermbg=255 cterm=None
hi CursorLine      guifg=None guibg=#131218 guisp=None gui=None ctermfg=None ctermbg=233 cterm=None
hi Function        guifg=#DCC8FF guibg=None guisp=None gui=None ctermfg=189 ctermbg=None cterm=None
hi Identifier      guifg=#F8F8F2 guibg=None guisp=None gui=None ctermfg=255 ctermbg=None cterm=None
hi Keyword         guifg=#81FFBE guibg=None guisp=None gui=None ctermfg=121 ctermbg=None cterm=None
hi LineNr          guifg=None guibg=None guisp=None gui=None ctermfg=None ctermbg=None cterm=None
hi Normal          guifg=#F8F8F2 guibg=#282634 guisp=None gui=None ctermfg=255 ctermbg=235 cterm=None
hi Number          guifg=#FFF9A3 guibg=None guisp=None gui=None ctermfg=229 ctermbg=None cterm=None
hi StorageClass    guifg=#FFB8D1 guibg=None guisp=None gui=None ctermfg=218 ctermbg=None cterm=None
hi String          guifg=#81EEFF guibg=None guisp=None gui=None ctermfg=123 ctermbg=None cterm=None
hi Type            guifg=#A3F3FF guibg=None guisp=None gui=bold ctermfg=159 ctermbg=None cterm=bold
hi Visual          guifg=None guibg=#8077A8 guisp=None gui=None ctermfg=None ctermbg=103 cterm=None




    " delete functions {{{
    delf <SID>X
    delf <SID>rgb
    delf <SID>color
    delf <SID>rgb_color
    delf <SID>rgb_level
    delf <SID>rgb_number
    delf <SID>grey_color
    delf <SID>grey_level
    delf <SID>grey_number
    " }}}
endif

" vim: set fdl=0 fdm=marker:

