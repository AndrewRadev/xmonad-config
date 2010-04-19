module Log where

import System.IO
import Control.Monad.State
import XMonad.Core
import XMonad.StackSet
import XMonad.Hooks.DynamicLog

customLogHook logger = dynamicLogWithPP $ xmobarPP
  { ppOutput = hPutStrLn logger
--  , ppTitle  = const "" -- No title
  , ppLayout = \layout -> "<fc=#1111ee>" ++ layout ++ "</fc>"
  , ppSep    = "<fc=#ee1111> : </fc>"
  , ppWsSep  = "<fc=#ee1111>-</fc>"
--   , ppExtras = extraStuff
  }

extraStuff :: [X (Maybe String)]
extraStuff = undefined
