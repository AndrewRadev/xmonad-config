module Util where

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicHooks

keypressesPipe = "~/.xmonad/pipes/keypresses"
statusPipe     = "~/.xmonad/pipes/status"

logKey key = do
	spawn $ "echo '<fc=#ff0000>[</fc>" ++ key ++ "<fc=#ff0000>]</fc>' >> " ++ keypressesPipe

logStatus message = do
	spawn $ "echo '" ++ message ++ "' >> " ++ statusPipe

spawnLog prog = do
  pid <- spawnPID prog
  logStatus $
    "<fc=#00ff00>>></fc> Started "
    ++ prog
    ++ " <fc=#ff0000>[</fc>"
    ++ show pid
    ++ "<fc=#ff0000>]</fc>"

spawnBackgroundLog cn prog = do
  oneShotHook (className =? cn) $ doF (W.shift "9")
  spawnLog prog

spawnLogMessage prog message = do
  spawn prog
  logStatus $ "<fc=#00ff00>>></fc> " ++ message
