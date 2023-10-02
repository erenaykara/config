#!/usr/bin/env python
import neovim
import os

addr = os.environ.get("NVIM", None)
nvim = neovim.attach("socket", path=addr)

nvim.vars['__autocd_cwd'] = os.getcwd()
nvim.command('execute "lcd" fnameescape(g:__autocd_cwd)')
del nvim.vars['__autocd_cwd']
