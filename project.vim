set tags+=/home/andrew/src/xmonad/tags,/home/andrew/src/XMonadContrib/tags

autocmd FileType haskell setlocal makeprg=ghc\ xmonad.hs\ -ilib

autocmd BufWritePost * silent exe "!touch xmonad.hs"
command! Console !ghci % -ilib
