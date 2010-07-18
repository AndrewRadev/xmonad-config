module Util where

import XMonad.Core

logKey key = do
	spawn $ "echo '<fc=#ff0000>[</fc>" ++ key ++ "<fc=#ff0000>]</fc>' >> ~/.xmonad/keypresses-pipe"

logStatus message = do
	spawn $ "echo '" ++ message ++ "' >> ~/.xmonad/status-pipe"

spawnLog prog = do
  pid <- spawnPID prog
  logStatus $
    "<fc=#00ff00>>></fc> Started "
    ++ prog
    ++ " <fc=#ff0000>[</fc>"
    ++ show pid
    ++ "<fc=#ff0000>]</fc>"

spawnLogMessage prog message = do
  spawn prog
  logStatus $ ">> " ++ message
