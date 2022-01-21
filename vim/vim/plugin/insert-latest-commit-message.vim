if exists('g:loaded_insertcommit') | finish | endif
let g:loaded_insertcommit = 1

function! InsertLatestCommitMessage(...)
  let numberOfLine = a:0 > 0 ? a:1 : 1
  let decorator  = a:0 > 1 ? a:2 : '*'
  execute 'read !git log --pretty=format:"' . decorator . ' \%s (\%h)" --date=short -n ' . numberOfLine
endfunction
command! -nargs=* InsertLatestCommitMessage call InsertLatestCommitMessage(<f-args>)
