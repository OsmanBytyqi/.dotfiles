require("osmani.set")
require("osmani.remap")
require("osmani.packer")

local augroup = vim.api.nvim_create_augroup
Osmani = augroup('osmani', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd('VimLeave', {
    pattern = "*.tex",
    command = "!texclear %"
})
autocmd({"BufRead","BufNewFile","VimLeave"},{
        pattern ="*.tex",
        command ="set filetype=tex"
})

autocmd({"BufRead", "BufNewFile"},{
    pattern="xresources",
    command="set filetype=xdefaults"
})
autocmd({"BufWritePost"},{
    pattern="xresources",
    command="!xrdb %",

})
autocmd({"BufWritePre"}, {
    group = Osmani,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

function on_bufwritepost_dwmblocks_config()
  vim.cmd("!cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }")
end
vim.cmd("autocmd BufWritePost ~/.local/src/dwmblocks/config.h lua on_bufwritepost_dwmblocks_config()")
