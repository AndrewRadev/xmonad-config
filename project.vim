set tags+=/home/andrew/src/xmonad/tags,/home/andrew/src/XMonadContrib/tags

autocmd FileType haskell set makeprg=ghc\ xmonad.hs\ -ilib
command! Console !ghci % -ilib
