module Keys where

import System.Exit

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

import XMonad.Prompt
import XMonad.Prompt.AppendFile

import XMonad.Actions.Search

import XMonad.Util.Run
import XMonad.Util.EZConfig

phpManual = searchEngine "php.net" "http://php.net/manual-lookup.php?pattern="
thePirateBay = searchEngine "The Pirate Bay" "http://thepiratebay.org/search/"

customXPConfig = defaultXPConfig
  { font = "xft:Andale Mono:bold"
  , bgColor = "#000000"
  , fgColor = "#eeeeee"
  , borderColor = "#000000"
  , historySize = 0
  }

customKeymap =
  -- Default keys:
  {-
  [ ("M-S-<Return>", spawn $ XMonad.terminal conf)
  , ("M-p", spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
  , ("M-S-p", spawn "gmrun")
  , ("M-S-c", kill)
  , ("M-<Space>", sendMessage NextLayout)
  , ("M-n", refresh)
  , ("M-<Tab>", windows W.focusDown)
  , ("M-j", windows W.focusDown)
  , ("M-k", windows W.focusUp)
  , ("M-m", windows W.focusMaster)
  , ("M-<Return>", windows W.swapDown)
  , ("M-S-j", windows W.swapDown)
  , ("M-S-k", windows W.swapUp)
  , ("M-h", sendMessage Shrink)
  , ("M-l", sendMessage Expand)
  , ("M-t", withFocused $ windows . W.sink)
  , ("M-,", sendMessage (IncMasterN 1))
  , ("M-.", sendMessage (IncMasterN (-1)))
  , ("M-S-q", io (exitWith ExitSuccess))
  , ("M-q", broadcastMessage ReleaseResources >> restart "xmonad" True)
  -}
  -- Additional keys:
  [ ("M-<F3>", spawn "amixer set 'Master' toggle")
  , ("M-<F4>", spawn "amixer set 'Master' 5- unmute")
  , ("M-<F5>", spawn "amixer set 'Master' 5+ unmute")
  , ("M-<Backspace>", focusUrgent)
  , ("M-n", appendFilePrompt customXPConfig "/home/andrew/NOTES")
  , ("M-x g", spawn "gvim")
  , ("M-x f", spawn "firefox")
  , ("M-x t", spawn "thunar")
  , ("M-x s", spawn "sonata")
  , ("M-<Escape>", sendMessage ToggleStruts) 
  , ("M-s g", promptSearch customXPConfig google)
  , ("M-s h", promptSearch customXPConfig hoogle)
  , ("M-s w", promptSearch customXPConfig wikipedia)
  , ("M-s y", promptSearch customXPConfig youtube)
  , ("M-s p", promptSearch customXPConfig phpManual)
  , ("M-s t", promptSearch customXPConfig thePirateBay)
  ]
