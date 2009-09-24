import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.NoBorders

import XMonad.Prompt
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.AppendFile

import XMonad.Actions.WindowBringer
import XMonad.Actions.Search

import XMonad.Util.Run
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

import IO
import System.Exit
import Graphics.X11.Xlib

phpManual = searchEngine "php.net" "http://php.net/manual-lookup.php?pattern="
thePirateBay = searchEngine "The Pirate Bay" "http://thepiratebay.org/search/"

customConfig statusBar = defaultConfig
    { borderWidth = 3
    , terminal = "urxvtc"
    , normalBorderColor = "#cccccc"
    , focusedBorderColor = "#111199"
    , focusFollowsMouse = False
    -- , workspaces = ["main", "skype", "music"] ++ map show [4..9]
    , logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn statusBar
      -- , ppTitle = xmobarColor "green" ""
      , ppTitle = (\_ -> "")
      }
    , manageHook = customManageHook
    , layoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig
    } `additionalKeysP` (customKeys customConfig)

main = do
  xmobar <- spawnPipe "xmobar"
  xmonad $
    withUrgencyHook dzenUrgencyHook { args = ["-bg", "red", "-xs", "1"] } $
    (customConfig xmobar)

customManageHook = manageDocks
  <+> composeAll
    [ className =? "Gimp"   --> doFloat
    -- , className =? "Skype"  --> doF (W.shift "skype")
    -- , className =? "Sonata" --> doF (W.shift "music")
    ]
  <+> manageHook defaultConfig

customXPConfig = defaultXPConfig
  { font = "xft:Andale Mono:bold"
  , bgColor = "#000000"
  , fgColor = "#eeeeee"
  , borderColor = "#000000"
  , historySize = 0
  }

customKeys conf = 
  [ ("M-<F3>", spawn "amixer set 'Master' toggle")
  , ("M-<F4>", spawn "amixer set 'Master' 5- unmute")
  , ("M-<F5>", spawn "amixer set 'Master' 5+ unmute")
  , ("M-<Backspace>", focusUrgent)
  , ("M-n", appendFilePrompt customXPConfig "/home/andrew/NOTES")
  , ("M-g", spawn "gvim")
  , ("M-f", spawn "firefox")
  , ("M-t", spawn "thunar")
  , ("M-m", spawn "sonata")
  , ("M-<Escape>", sendMessage ToggleStruts) 
  , ("M-s g", promptSearch customXPConfig google)
  , ("M-s h", promptSearch customXPConfig hoogle)
  , ("M-s w", promptSearch customXPConfig wikipedia)
  , ("M-s y", promptSearch customXPConfig youtube)
  , ("M-s p", promptSearch customXPConfig phpManual)
  , ("M-s t", promptSearch customXPConfig thePirateBay)
  ]
