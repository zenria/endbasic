' EndBASIC
' Copyright 2020 Julio Merino
'
' Licensed under the Apache License, Version 2.0 (the "License"); you may not
' use this file except in compliance with the License.  You may obtain a copy
' of the License at:
'
'     http://www.apache.org/licenses/LICENSE-2.0
'
' Unless required by applicable law or agreed to in writing, software
' distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
' WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
' License for the specific language governing permissions and limitations
' under the License.

' Tests screen manipulation commands.
'
' Note that the output of this test stored in `console.out` contains control
' characters and that we simply expect that they produce the correct visual
' effect.  For that reason, whenever modifying this test, make sure to run it
' by hand and observe if it's doing the right thing before overwriting the
' golden data file.

PRINT "Before clearing the screen"
COLOR 15, 4
CLS
PRINT "After clearing the screen"

row = 0
fg = 0
WHILE row < 10
    column = 0
    WHILE column < 20
        COLOR fg, 4
        LOCATE column + 10, row + 5
        PRINT "#"
        column = column + 1
        fg = (fg + 1) MOD 15
    WEND
    row = row + 1
WEND

LOCATE 0, 100
