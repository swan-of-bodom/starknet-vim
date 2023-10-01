> :warning: Deprecated since Cairo 1. Now using <a href="https://github.com/swan-of-bodom/scarb-vim">Scarb Vim</a>.



# Starknet Vim

Updated Vim plugin to write Cairo contracts on Starknet.

1. Auto-format
2. Syntax highlighting
3. Asynchronous linting with Vim ALE
4. Ctags

## Tags:

![image](https://user-images.githubusercontent.com/97303883/187670633-604c8510-a6f1-42d0-a101-3e3be5bc5e34.png)

## Linting:

![image](https://user-images.githubusercontent.com/97303883/187670841-efd878ca-9060-4393-946a-24dee6101232.png)

![image](https://user-images.githubusercontent.com/97303883/187671080-936ceba9-33fd-4180-be48-8040a1694b53.png)

Ctags regex:

```
--langdef=cairo
--map-cairo=+.cairo
--mline-regex-cairo=/@event([[:space:]])*([a-z ]+)[[:space:]]*([a-zA-Z]*)\(/\3\4/e,event/{mgroup=0}
--mline-regex-cairo=/@storage_var([[:space:]]+)func[ \t]+([a-zA-Z0-9_]+)*\(/\2\3/s,storage/{mgroup=0}
--mline-regex-cairo=/@constructor([[:space:]]+)func*([a-z ]+)*\{/\2\3/c,constructor/{mgroup=0}
--mline-regex-cairo=/@external([[:space:]]+)func*(.*)\{/\2\3/f,external/{mgroup=0}
--mline-regex-cairo=/@view([[:space:]]+)func*(.*)\{/\2\3/v,view/{mgroup=0}
--mline-regex-cairo=/(error_message+)\("(.*)\"/\2\3/r,error/{mgroup=0}
```

# Install

with Vim-Plug:

`Plug '0xhyoga/starknet-vim'`

and put this in your .vimrc:

`filetype plugin on`

For ALE you can install here: https://github.com/dense-analysis/ale

For universal Ctags you can follow here for instructions https://github.com/universal-ctags/ctags 

Depending on your setup, you will need to create a .ctags file with the above regex rules
