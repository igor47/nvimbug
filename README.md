# neovim bug reproduction 

in terminal one, run:
  nvim --clean -u init.lua crash.py

place the cursor at the end of the file (seems to help to repro?)

switch to terminal 2 and run:
  echo 'print()' >> crash.py

go back to terminal 1, enter insert mode with `a`, and enter a character

you might need this a few times. you should see:

```
Error executing lua callback: /usr/share/nvim/runtime/lua/vim/lsp/sync.lua:177: attempt to get length of local 'prev_lin
e' (a nil value)
stack traceback:
        /usr/share/nvim/runtime/lua/vim/lsp/sync.lua:177: in function 'compute_start_range'
        /usr/share/nvim/runtime/lua/vim/lsp/sync.lua:408: in function 'compute_diff'
        /usr/share/nvim/runtime/lua/vim/lsp.lua:446: in function 'incremental_changes'
        /usr/share/nvim/runtime/lua/vim/lsp.lua:639: in function 'send_changes'
        /usr/share/nvim/runtime/lua/vim/lsp.lua:1576: in function </usr/share/nvim/runtime/lua/vim/lsp.lua:1563>
```
