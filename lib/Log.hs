module Log where

import System.IO
import Control.Monad.State
import XMonad.Core
import XMonad.StackSet
import XMonad.Hooks.DynamicLog

customLogHook logger = dynamicLogWithPP $ xmobarPP
  { ppOutput = hPutStrLn logger
  , ppTitle  = \s -> "<fc=#11ee11>" ++ s ++ "</fc>"
  , ppLayout = \l -> "<fc=#1111ee>" ++ l ++ "</fc>"
  , ppSep    = "<fc=#ff0000>|</fc>"
  , ppWsSep  = "<fc=#ff0000>-</fc>"
--   , ppExtras = extraStuff
  }

extraStuff :: [X (Maybe String)]
extraStuff = undefined
