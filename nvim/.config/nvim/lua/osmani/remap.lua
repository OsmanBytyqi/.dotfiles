vim.keymap.set("n","<leader>e", ":Ex<CR>")
vim.keymap.set("n","<leader>u", ":UndotreeShow<CR>")

vim.keymap.set("v","J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v","K", ":m '<-2<CR>gv=gv")


---Open my bibliography file in split
-- nnoremap ("<leader>b","<cmd> :vsp<space>$BIB<CR>")
vim.keymap.set("n", "<leader>b","<cmd> :vsp<space>$BIB<CR>" )

--Compile document, be it groff/LaTeX/markdown/etc.
vim.keymap.set("n","<leader>c","<cmd>w<CR><cmd>! compiler %<CR>")

-- open corresponding .pdf/.html or preview
vim.keymap.set("n","<leader>p","<cmd>!opout %<CR><CR>")

-- Replace all is aliased to S.
vim.keymap.set("n","<leader>s",":%s//g<Left><Left>")
vim.keymap.set("n","<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n","<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n","<C-j>", "<cmd>cprev<CR>zz")
--

vim.keymap.set("n", "<leader>h", function()
        if vim.opt.laststatus._value == 0 then
            vim.opt.laststatus = 2
        else
            vim.opt.laststatus = 0
        end
end)

