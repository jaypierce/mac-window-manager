# mac-window-manager

Simple keyboard window snapping for macOS, built with [Hammerspoon](https://www.hammerspoon.org).

## Setup

1. Install [Hammerspoon](https://www.hammerspoon.org).
2. Clone this repo as your Hammerspoon config folder:

   ```sh
   git clone https://github.com/jaypierce/mac-window-manager.git ~/.hammerspoon
   ```

   If `~/.hammerspoon` already exists and isn't empty, back it up and move it first.
3. Open Hammerspoon. If it's already running, choose **Reload Config** from its menu bar icon.
4. Allow Hammerspoon under **System Settings → Privacy & Security → Accessibility**. It needs this to move windows.
5. Optional: to start it automatically, turn on **Launch Hammerspoon at login** in its preferences.

## Shortcuts

| Shortcut | Action |
| --- | --- |
| `Option` + `←` | Snap to the left side |
| `Option` + `→` | Snap to the right side |
| `Option` + `↑` | Snap to the top |
| `Option` + `↓` | Snap to the bottom |

Combine shortcuts to reach the corners. For example, press `Option` + `←`, then `Option` + `↑` for the top-left quarter.

- From a top corner, `Option` + `↑` expands to the top half. Press it again to fill the screen.
- From a bottom corner, `Option` + `↓` minimizes the window.

These shortcuts replace the usual `Option` + arrow behavior, such as moving the cursor one word at a time. To use different modifier keys, edit `mods` at the top of `init.lua`.
