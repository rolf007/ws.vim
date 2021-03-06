syn clear
" sync fromstart to get more accurate syntax highlight.
syntax sync fromstart

syn match wsNumber '.*' contained contains=wsNumberSpace,wsNumberTab
syn match wsLabel '.*' contained contains=wsLabelSpace,wsLabelTab

syn match wsKeywordSpace ' ' contained
syn match wsKeywordTab '\t' contained
syn match wsFirstSpace ' ' contained
syn match wsFirstTab '\t' contained
syn match wsNumberSpace ' ' contained
syn match wsNumberTab '\t' contained
syn match wsLabelSpace ' ' contained
syn match wsLabelTab '\t' contained

syn match wsReturnA    '\t\S*\n'        contained contains=wsFirstTab
syn match wsJumpNegB   '\t\S*'          contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsLabel
syn match wsJumpNegA   '\t\S*'          contained contains=wsFirstTab nextgroup=wsJumpNegB
syn match wsJumpZeroB  ' \S*'           contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsLabel
syn match wsJumpZeroA  '\t\S*'          contained contains=wsFirstTab nextgroup=wsJumpZeroB
syn match wsJumpA      ' \S*\n\S*'      contained contains=wsFirstSpace nextgroup=wsLabel
syn match wsCallB      '\t\S*'          contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsLabel
syn match wsCallA      ' \S*'           contained contains=wsFirstSpace nextgroup=wsCallB
syn match wsMarkB      ' \S*'           contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsLabel
syn match wsMarkA      ' \S*'           contained contains=wsFirstSpace nextgroup=wsMarkB
syn match wsReadNumB   '\t\S*\t'        contained contains=wsKeywordSpace,wsKeywordTab
syn match wsReadNumA   '\t\S*\n\S*'     contained contains=wsFirstTab nextgroup=wsReadNumB
syn match wsReadCharB  '\t\S* '         contained contains=wsKeywordSpace,wsKeywordTab
syn match wsReadCharA  '\t\S*\n\S*'     contained contains=wsFirstTab nextgroup=wsReadCharB
syn match wsWriteNumB  ' \S*\t'         contained contains=wsKeywordSpace,wsKeywordTab
syn match wsWriteNumA  '\t\S*\n\S*'     contained contains=wsFirstTab nextgroup=wsWriteNumB
syn match wsWriteCharB ' \S* '          contained contains=wsKeywordSpace,wsKeywordTab
syn match wsWriteCharA '\t\S*\n\S*'     contained contains=wsFirstTab nextgroup=wsWriteCharB
syn match wsPopA       ' \S*\n\S*\n\S*' contained contains=wsFirstSpace nextgroup=wsPopB
syn match wsSwapB      '\t'             contained contains=wsKeywordSpace,wsKeywordTab
syn match wsSwapA      ' \S*\n\S*'      contained contains=wsFirstSpace nextgroup=wsSwapB
syn match wsDuplicateB ' '              contained contains=wsKeywordSpace,wsKeywordTab
syn match wsDuplicateA ' \S*\n\S*'      contained contains=wsFirstSpace nextgroup=wsDuplicateB
syn match wsSlideB     '\t\S*\n\S*'     contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsNumber
syn match wsSlideA     ' \S*'           contained contains=wsFirstSpace nextgroup=wsSlideB
syn match wsGetB       '\t\S*\t'        contained contains=wsKeywordSpace,wsKeywordTab
syn match wsGetA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsGetB
syn match wsPutB       '\t\S* '         contained contains=wsKeywordSpace,wsKeywordTab
syn match wsPutA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsPutB
syn match wsMulB       ' \S* \S*\n'     contained contains=wsKeywordSpace,wsKeywordTab
syn match wsMulA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsMulB
syn match wsPushB      ' \S*'           contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsNumber
syn match wsPushA      ' \S*\S*'        contained contains=wsFirstSpace nextgroup=wsPushB
syn match wsModB       ' \S*\t\S*\t'    contained contains=wsKeywordSpace,wsKeywordTab
syn match wsModA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsModB
syn match wsDivB       ' \S*\t\S* '     contained contains=wsKeywordSpace,wsKeywordTab
syn match wsDivA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsDivB
syn match wsSubB       ' \S* \S*\t'     contained contains=wsKeywordSpace,wsKeywordTab
syn match wsSubA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsSubB
syn match wsAddB       ' \S* \S* '      contained contains=wsKeywordSpace,wsKeywordTab
syn match wsAddA       '\t\S*'          contained contains=wsFirstTab nextgroup=wsAddB
syn match wsCopyB      '\t\S* \S*'      contained contains=wsKeywordSpace,wsKeywordTab nextgroup=wsNumber
syn match wsCopyA      ' \S*'           contained contains=wsFirstSpace nextgroup=wsCopyB

syn cluster wsStartsWithNewline add=wsReturn,wsJumpNeg,wsJumpZero,wsJump,wsCall,wsMark,wsReturnN,wsJumpNegN,wsJumpZeroN,wsJumpN,wsCallN,wsMarkN

syn match wsReturn     '\t\S*\n'          contains=wsReturnA
syn match wsReturnN    '\t\S*\n\S*\n'     contains=wsReturnA nextgroup=@wsStartsWithNewline
syn match wsJumpNeg    '\t\S*\t.*\n'      contains=wsJumpNegA,wsJumpNegB,wsLabel
syn match wsJumpNegN   '\t\S*\t.*\n\S*\n' contains=wsJumpNegA,wsJumpNegB,wsLabel nextgroup=@wsStartsWithNewline
syn match wsJumpZero   '\t\S*\ .*\n'      contains=wsJumpZeroA,wsJumpZeroB,wsLabel
syn match wsJumpZeroN  '\t\S*\ .*\n\S*\n' contains=wsJumpZeroA,wsJumpZeroB,wsLabel nextgroup=@wsStartsWithNewline
syn match wsJump       '\ \S*\n.*\n'      contains=wsJumpA,wsLabel
syn match wsJumpN      '\ \S*\n.*\n\S*\n' contains=wsJumpA,wsLabel nextgroup=@wsStartsWithNewline
syn match wsCall       '\ \S*\t.*\n'      contains=wsCallA,wsCallB,wsLabel
syn match wsCallN      '\ \S*\t.*\n\S*\n' contains=wsCallA,wsCallB,wsLabel nextgroup=@wsStartsWithNewline
syn match wsMark       '\ \S*\ .*\n'      contains=wsMarkA,wsMarkB,wsLabel
syn match wsMarkN      '\ \S*\ .*\n\S*\n' contains=wsMarkA,wsMarkB,wsLabel nextgroup=@wsStartsWithNewline

syn match wsError '\s'

syn match wsPush       '\ \S*\ .*\n'            contains=wsPushA,wsPushB,wsNumber
syn match wsPushN      '\ \S*\ .*\n\S*\n'       contains=wsPushA,wsPushB,wsNumber nextgroup=@wsStartsWithNewline
syn match wsCopy       '\ \S*\t\S*\ .*\n'       contains=wsCopyA,wsCopyB,wsNumber
syn match wsCopyN      '\ \S*\t\S*\ .*\n\S*\n'  contains=wsCopyA,wsCopyB,wsNumber nextgroup=@wsStartsWithNewline
syn match wsSlide      '\ \S*\t\S*\n.*\n'       contains=wsSlideA,wsSlideB,wsNumber
syn match wsSlideN     '\ \S*\t\S*\n.*\n\S*\n'  contains=wsSlideA,wsSlideB,wsNumber nextgroup=@wsStartsWithNewline
syn match wsDuplicate  '\ \S*\n\S*\ '           contains=wsDuplicateA,wsDuplicateB
syn match wsDuplicateN '\ \S*\n\S*\ \S*\n'      contains=wsDuplicateA,wsDuplicateB nextgroup=@wsStartsWithNewline
syn match wsSwap       '\ \S*\n\S*\t'           contains=wsSwapA,wsSwapB
syn match wsSwapN      '\ \S*\n\S*\t\S*\n'      contains=wsSwapA,wsSwapB nextgroup=@wsStartsWithNewline
syn match wsPop        '\ \S*\n\S*\n'           contains=wsPopA
syn match wsPopN       '\ \S*\n\S*\n\S*\n'      contains=wsPopA nextgroup=@wsStartsWithNewline
syn match wsAdd        '\t\S*\ \S*\ \S* '       contains=wsAddA,wsAddB
syn match wsAddN       '\t\S*\ \S*\ \S* \S*\n'  contains=wsAddA,wsAddB nextgroup=@wsStartsWithNewline
syn match wsSub        '\t\S*\ \S*\ \S*\t'      contains=wsSubA,wsSubB
syn match wsSubN       '\t\S*\ \S*\ \S*\t\S*\n' contains=wsSubA,wsSubB nextgroup=@wsStartsWithNewline
syn match wsMul        '\t\S*\ \S*\ \S*\n'      contains=wsMulA,wsMulB
syn match wsMulN       '\t\S*\ \S*\ \S*\n\S*\n' contains=wsMulA,wsMulB nextgroup=@wsStartsWithNewline
syn match wsDiv        '\t\S*\ \S*\t\S* '       contains=wsDivA,wsDivB
syn match wsDivN       '\t\S*\ \S*\t\S* \S*\n'  contains=wsDivA,wsDivB nextgroup=@wsStartsWithNewline
syn match wsMod        '\t\S*\ \S*\t\S*\t'      contains=wsModA,wsModB
syn match wsModN       '\t\S*\ \S*\t\S*\t\S*\n' contains=wsModA,wsModB nextgroup=@wsStartsWithNewline
syn match wsGet        '\t\S*\t\S*\t'           contains=wsGetA,wsGetB
syn match wsGetN       '\t\S*\t\S*\t\S*\n'      contains=wsGetA,wsGetB nextgroup=@wsStartsWithNewline
syn match wsPut        '\t\S*\t\S*\ '           contains=wsPutA,wsPutB
syn match wsPutN       '\t\S*\t\S*\ \S*\n'      contains=wsPutA,wsPutB nextgroup=@wsStartsWithNewline
syn match wsWriteChar  '\t\S*\n\S*\ \S* '       contains=wsWriteCharA,wsWriteCharB
syn match wsWriteCharN '\t\S*\n\S*\ \S* \S*\n'  contains=wsWriteCharA,wsWriteCharB nextgroup=@wsStartsWithNewline
syn match wsWriteNum   '\t\S*\n\S*\ \S*\t'      contains=wsWriteNumA,wsWriteNumB
syn match wsWriteNumN  '\t\S*\n\S*\ \S*\t\S*\n' contains=wsWriteNumA,wsWriteNumB nextgroup=@wsStartsWithNewline
syn match wsReadNum    '\t\S*\n\S*\t\S*\t'      contains=wsReadNumA,wsReadNumB
syn match wsReadNumN   '\t\S*\n\S*\t\S*\t\S*\n' contains=wsReadNumA,wsReadNumB nextgroup=@wsStartsWithNewline
syn match wsReadChar   '\t\S*\n\S*\t\S*\ '      contains=wsReadCharA,wsReadCharB
syn match wsReadCharN  '\t\S*\n\S*\t\S*\ \S*\n' contains=wsReadCharA,wsReadCharB nextgroup=@wsStartsWithNewline

hi wsKeywordSpace term=NONE cterm=NONE ctermbg=DarkBlue guibg=DarkBlue
hi wsKeywordTab term=NONE cterm=NONE ctermbg=Black guibg=Black
hi wsFirstSpace term=NONE cterm=NONE ctermbg=DarkGreen guibg=DarkGreen
hi wsFirstTab term=NONE cterm=NONE ctermbg=DarkMagenta guibg=DarkMagenta
hi wsNumberSpace term=NONE cterm=NONE ctermbg=Grey guibg=Grey
hi wsNumberTab term=NONE cterm=NONE ctermbg=DarkCyan guibg=DarkCyan
hi wsLabelSpace term=NONE cterm=NONE ctermbg=Grey guibg=Grey
hi wsLabelTab term=NONE cterm=NONE ctermbg=Brown guibg=#a06000
hi wsError term=NONE cterm=NONE ctermbg=DarkRed guibg=DarkRed
