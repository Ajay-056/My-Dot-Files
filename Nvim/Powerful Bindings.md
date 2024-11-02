### Normal Mode
1. dot (.) --> repeat last thing done
2. gx / gf / gv / gi / g; / g, / gn / gJ / gM
3. Jumps / Changes / Marks / Macros / Folds
4. Use of all 10 registers for yank and paste
5. dj, dk, d3j, d3k, dG
6. gg=G --> indent whole file / >>/<< / >k/<j / >}
7. 2g ctrl + a/x --> Increment or decrement
8. ~ / guu / gUU / g~~ / gU} / gUfl --> case change
9. Ctrl+6 / Ctrl+^ --> switch back to the previous buffer, works even if that buffer is not named
12. u , ctrl + r --> Undo and Redo
13. M (or) zz --> move to middle of screen
14. w,e,b,ge,W,E,B,gE

### Insert Mode
1. i/a I/A o/O
2. ctrl + o{normal}
3. ctrl + r{register}
4. ctrl + a / y / j / t / d

### Search and Replace
1. :g (or) v/word_to_find (or) regex/normal mode (or) command mode commands  --> can be used in combination with other commands
2. :let i=0 | let j=1 | while j <= 5 | execute '%s/_' . i . '_/_T0' . j . '_/c' | let i=i+1 | let j=j+1 | endwhile  --> Programatic repeated substitution
3. /searchpattern/(s or e)(+ or -)n    /searchpattern/(+ or -)n

### Command Mode
1. :e! % ---> Refresh current file buffer
2. :% !jq --> Pretty print JSON
3. :e# --> switch back to the previous buffer, won't work if that buffer is not named
4. :tabm 0/+n/-n -->tab move
5. :tabe {filename} --> new tab file edit
6. :mksession / :mksession! / :source proj.vim / nvim -S proj.vim --> Session Management
7. :5d / :5yank / :$d / :25m0 / :25t0 / :2,10d / :5,$-1d / :%d
8. :put - pastes the content after current line  / :put! - pastes the content before current line
9. :r! / :.! / :%! sort / :.!grep '^Help ' %  --> Shell commands
10. :vs / :sp --> split the screen
