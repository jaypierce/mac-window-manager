local mods = {"alt"}
hs.window.animationDuration = 0

local function near(a, b) return math.abs(a - b) < 20 end

local function snap(dir)
  local win = hs.window.focusedWindow()
  if not win then return end
  local f, s = win:frame(), win:screen():frame()

  -- Work out where the window is now
  local h, v
  if near(f.w, s.w / 2) then
    if near(f.x, s.x) then h = "left"
    elseif near(f.x, s.x + s.w / 2) then h = "right" end
  end
  if near(f.h, s.h / 2) then
    if near(f.y, s.y) then v = "top"
    elseif near(f.y, s.y + s.h / 2) then v = "bottom" end
  end
  if not ((h or near(f.w, s.w)) and (v or near(f.h, s.h))) then
    h, v = nil, nil
  end

  -- Pressing down in a bottom corner minimizes
  if dir == "bottom" and v == "bottom" and h then
    win:minimize()
    return
  end

  if dir == "top" and v == "top" then
    -- Top corner -> top half -> full screen
    if h then h = nil else v = nil end
  elseif dir == "left" or dir == "right" then
    h = dir
  else
    v = dir
  end

  win:setFrame({
    x = (h == "right") and s.x + s.w / 2 or s.x,
    y = (v == "bottom") and s.y + s.h / 2 or s.y,
    w = h and s.w / 2 or s.w,
    h = v and s.h / 2 or s.h,
  })
end

hs.hotkey.bind(mods, "left",  function() snap("left") end)
hs.hotkey.bind(mods, "right", function() snap("right") end)
hs.hotkey.bind(mods, "up",    function() snap("top") end)
hs.hotkey.bind(mods, "down",  function() snap("bottom") end)