module Log where

import System.IO
import XMonad.Core
import XMonad.Hooks.DynamicLog

customLogHook logger = dynamicLogWithPP $ xmobarPP
  { ppOutput = hPutStrLn logger
  , ppTitle  = \s -> "<fc=#11ee11>" ++ s ++ "</fc>"
--  , ppTitle = const ""
  , ppLayout = \l -> "<fc=#1111ee>" ++ l ++ "</fc>"
  , ppSep    = "<fc=#ff0000>|</fc>"
  , ppWsSep  = "<fc=#ff0000>-</fc>"
--   , ppExtras = extraStuff
  }

extraStuff :: [X (Maybe String)]
extraStuff = undefined
