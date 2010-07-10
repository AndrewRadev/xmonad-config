module Util where

import XMonad.Core

logStatus message = do
	spawn $ "echo '" ++ message ++ "' >> ~/.xmonad/status"

spawnLog prog = do
  pid <- spawnPID prog
  logStatus $ ">> Started " ++ prog ++" [" ++ show pid ++ "]"

spawnLogMessage prog message = do
  spawn prog
  logStatus $ ">> " ++ message
