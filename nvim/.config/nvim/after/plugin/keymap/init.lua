local Remap = require("osmani.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>e", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")


---Open my bibliography file in split
nnoremap ("<leader>b","<cmd> :vsp<space>$BIB<CR>")

--Compile document, be it groff/LaTeX/markdown/etc.
nnoremap("<leader>c","<cmd>w<CR><cmd>! compiler %<CR>")

-- open open corresponding .pdf/.html or preview
nnoremap("<leader>p","<cmd>!opout %<CR><CR>")

nnoremap("S",":%s//g<Left><Left>")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
