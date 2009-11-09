module Startup where

import XMonad

customStartupHook :: X ()
customStartupHook = do
  spawn "urxvt -name ncmpcpp -e ncmpcpp"
  spawn "urxvt -name htop -e htop"
  return ()
