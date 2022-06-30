    "  _         _____
    " | |    __ |_   _|____  __
    " | |   / _` || |/ _ \ \/ /
    " | |__| (_| || |  __/>  <
    " |_____\__,_||_|\___/_/\_\

autocmd BufRead,BufNewFile *.tex set filetype=tex
autocmd Filetype tex noremap <F4> :!biber<Space><C-R>%<Backspace><Backspace><Backspace><Backspace><CR>
autocmd Filetype tex noremap <F3> :w<cr>:!clear && pdflatex %<CR>
autocmd Filetype tex inoremap ww <esc>/<++><enter>"_c4l
autocmd Filetype tex inoremap ;s \section{}<Enter><Enter><++><Esc>2kf}i
autocmd Filetype tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd Filetype tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd Filetype tex inoremap ;d \begin{document}<Enter><++><Enter>\end{document}<Esc>kI
autocmd Filetype tex inoremap ;e \begin{equation}<Enter><Enter>\end{equation}<Enter><++><Esc>2kI
autocmd Filetype tex inoremap ;a \begin{abstract}<Enter><Enter>\end{abstract}<Enter><++><Esc>2kI
autocmd Filetype tex inoremap ;b \begin{LRN}<Enter><++><Enter>\end{LRN}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>LRN<Enter>c
autocmd Filetype tex inoremap ;f \begin{figure}[H]<Enter>\centering<Enter>\includegraphics[width=<++>\textwidth]{<++>}<Enter>\caption{<++>}<Enter>\end{figure}<Enter><++>

autocmd Filetype html inoremap ww <esc>/<++><enter>"_c4l
