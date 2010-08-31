module Keys where

import System.Exit

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.DynamicHooks

import XMonad.Layout.Magnifier as Mag

import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.AppendFile

import XMonad.Actions.Search
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.GridSelect

import XMonad.Util.Run
import XMonad.Util.EZConfig

import Util

phpManual    = searchEngine "php.net" "http://php.net/manual-lookup.php?pattern="
thePirateBay = searchEngine "The Pirate Bay" "http://thepiratebay.org/search/"

customXPConfig = defaultXPConfig
  { font        = "-xos4-terminus-*-*-*-*-14-*-*-*-*-*-*-*"
  , bgColor     = "#000000"
  , fgColor     = "#eeeeee"
  , borderColor = "#000000"
  , historySize = 20
  }

customGSConfig = defaultGSConfig
  { gs_cellheight = 30
  , gs_cellwidth = 200
  , gs_font = "-xos4-terminus-*-*-*-*-14-*-*-*-*-*-*-*"
  }

customKeys conf = mkKeymap conf (customKeyList conf)

customKeyList conf =
  map loggerize $

  -- Default keys

  [ ("M-S-<Return>", spawnLog $ XMonad.terminal conf)
  , ("M-S-p", spawnLog "gmrun")
  , ("M-S-c", kill)
  , ("M-<Space>", sendMessage NextLayout)
  , ("M-<Tab>", windows W.focusDown)
  , ("M-j", windows W.focusDown)
  , ("M-k", windows W.focusUp)
  , ("M-m", windows W.focusMaster)
  , ("M-<Return>", windows W.swapMaster)
  , ("M-S-j", windows W.swapDown)
  , ("M-S-k", windows W.swapUp)
  , ("M-h", sendMessage Shrink)
  , ("M-l", sendMessage Expand)
  , ("M-t", withFocused $ windows . W.sink)
  , ("M-,", sendMessage (IncMasterN 1))
  , ("M-.", sendMessage (IncMasterN (-1)))
  , ("M-S-q", io (exitWith ExitSuccess))
  , ("M-q", do
      spawn "killall xmobar"
      broadcastMessage ReleaseResources
      restart "xmonad" True
    )

  -- Additional keys

  -- music management
  , ("M-p", spawnLogMessage "mpc toggle" "Toggle song")
  , ("M-S-.", spawnLogMessage "mpc next" "Next song")
  , ("M-S-,", spawnLogMessage "mpc prev" "Previous song")

  -- workspace renaming (TODO: not working good enough
  , ("M-r", renameWorkspace customXPConfig)

  -- sound & brightness
  , ("M-<F3>", spawnLogMessage "amixer set 'Master' toggle" "Toggle sound")
  , ("M-<F4>", spawnLogMessage "sound 5-" "Sound 5-")
  , ("M-<F5>", spawnLogMessage "sound 5+" "Sound 5+")
  , ("M-<F8>", spawnLogMessage "brightness down" "Brightness down")
  , ("M-<F9>", spawnLogMessage "brightness up" "Brightness up")

  -- TODO: Urgent-ness not really happening anywhere I care about
  , ("M-<Backspace>", focusUrgent)

  -- quick notes
  , ("M-n", appendFilePrompt customXPConfig "/home/andrew/Dropbox/gtd/in")

  -- run stuff
  , ("M-S-x", shellPrompt customXPConfig)

  -- grid select
  , ("M-g", goToSelected customGSConfig)

  -- spawn stuff
  , ("M-x g", spawnLog "gvim")
  , ("M-x f", spawnLog "firefox")
  , ("M-x m", spawnLog "firefox gmail.com")
  , ("M-x t", spawnLog "thunar")

  -- spawn stuff on workspace 9
  , ("M-x S-g", spawnBackgroundLog "Gvim" "gvim")
  , ("M-x S-f", spawnBackgroundLog "Namoroka" "firefox")
  , ("M-x S-m", spawnBackgroundLog "Namoroka" "firefox gmail.com")
  , ("M-x S-t", spawnBackgroundLog "Thunar" "thunar")

  -- more fulscreen-ish, if necessary
  , ("M-<Escape>", sendMessage ToggleStruts)

  -- web searches
  , ("M-s g", promptSearch customXPConfig google)
  , ("M-s h", promptSearch customXPConfig hoogle)
  , ("M-s w", promptSearch customXPConfig wikipedia)
  , ("M-s y", promptSearch customXPConfig youtube)
  , ("M-s p", promptSearch customXPConfig phpManual)
  , ("M-s t", promptSearch customXPConfig thePirateBay)
  -- Experimental keymap switching
  , ("M-<F10> <F10>", spawn "setxkbmap us")
  , ("M-<F10> <F11>", spawn "setxkbmap bg phonetic")

  -- get pixel color in clipboard
  , ("M-<F11>", spawn "grabc 2>&1 | xclip -i")

  -- screenshots
  , ("M-<F12>", spawnLogMessage "scrot -e 'mv $f /home/andrew/images/shots/'" "Screenshot taken")

  -- magnifying windows
  , ("M-=", sendMessage Mag.Toggle)
  , ("M-S-=", sendMessage Mag.MagnifyMore)
  , ("M--", sendMessage Mag.MagnifyLess)
  ]
  ++
  zip (map (\s -> "M-" ++ show s) $ [1..9] ++ [0]) (map (withNthWorkspace W.greedyView) [0..])
  ++
  zip (map (\s -> "M-S-" ++ show s) $ [1..9] ++ [0]) (map (withNthWorkspace W.shift) [0..])
    where loggerize (key, action) = (key, newAction)
            where newAction = do
                    logKey key
                    action
