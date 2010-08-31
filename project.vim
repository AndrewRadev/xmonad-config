set tags+=~/src/xmonad/tags,~/src/XMonadContrib/tags

autocmd FileType haskell setlocal makeprg=ghc\ xmonad.hs\ -ilib

autocmd BufWritePost * silent exe "!touch xmonad.hs"
command! Console !ghci % -ilib
