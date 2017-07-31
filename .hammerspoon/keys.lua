local alert = require "hs.alert"
local hotkey = require "hs.hotkey"

hyper = {"cmd", "alt", "ctrl", "shift"}
local shortcuts = {
  ["normal"] = {},
  ["ergodox"] = {},
}

Keys = {
  ["specialTriggers"] = {
    ["ToggleKeyboard"] = {{{"ctrl", "alt", "cmd"}, "="}, {{"ctrl", "alt", "cmd"}, "="}},
    ["Lock"] = {{{"ctrl", "alt", "cmd"}, "L"}, {hyper, "9"}},
    ["Sleep"] = {{{"ctrl", "alt", "cmd"}, ";"}, {hyper, "0"}},
    ["Status"] = {{{"ctrl", "alt", "cmd"}, "S"}, {hyper, "\\"}},
    ["Reload"] = {{{"ctrl", "alt", "cmd"}, "R"}, {hyper, "3"}},
    ["Console"] = {{{"ctrl", "alt", "cmd"}, "C"}, {hyper, "4"}},
    ["WiFi"] = {{{"ctrl", "alt", "cmd"}, "W"}, {hyper, "1"}},
    ["Bluetooth"] = {{{"ctrl", "alt", "cmd"}, "E"}, {hyper, "2"}},
    ["Increase volume"] = {{{"alt", "cmd"}, "U"}, {hyper, "6"}},
    ["Decrease volume"] = {{{"alt", "cmd"}, "Y"}, {hyper, "5"}},
    ["Fullscreen window"] = {{{"alt", "cmd"}, "F"}, {hyper, "I"}},
    ["Center window"] = {{{"alt", "cmd"}, "C"}, {hyper, "K"}},
    ["Left 50% window"] = {{{"alt", "cmd"}, "["}, {hyper, "J"}},
    ["Right 50% window"] = {{{"alt", "cmd"}, "]"}, {hyper, "L"}},
    ["Top left 25% window"] = {{{"ctrl", "alt"}, "["}, {hyper, "U"}},
    ["Top right 25% window"] = {{{"ctrl", "alt"}, "]"}, {hyper, "O"}},
    ["Bottom center 25% window"] = {{{"ctrl", "alt"}, "\\"}, {nil, "f15"}},
    ["Move window display left"] = {{{"alt", "cmd"}, "-"}, {hyper, "Y"}},
    ["Move window display right"] = {{{"alt", "cmd"}, "="}, {hyper, "P"}},
    ["Shrink window"] = {{{"ctrl", "alt"}, "-"}, {hyper, "pagedown"}},
    ["Grow window"] = {{{"ctrl", "alt"}, "="}, {hyper, "pageup"}},
  },
  ["triggers"] = {
    ["Hyper"] = {{{"alt", "cmd"}, "7"}, {hyper, "J"}},
    ["Code"] = {{{"alt", "cmd"}, "8"}, {hyper, "K"}},
    ["Google Chrome"] = {{{"alt", "cmd"}, "9"}, {hyper, "L"}},
    ["Slack"] = {{{"alt", "cmd"}, "0"}, {hyper, "B"}},
  },
}

function Keys.keyFor(name)
  local keys = Keys.triggers[name]
  if not keys then
    keys = Keys.specialTriggers[name]
  end

  return keys
end

function Keys.bindKeyFor(appName, fn)
  keys = Keys.keyFor(appName)
  normalKeys = keys[1]
  ergodoxKeys = keys[2]
  shortcuts["normal"][appName] = hotkey.new(normalKeys[1], normalKeys[2], fn)
  shortcuts["ergodox"][appName] = hotkey.new(ergodoxKeys[1], ergodoxKeys[2], fn)
end

function Keys.deactivateKeys()
  for _, keys in pairs(shortcuts) do
    for __, k in pairs(keys) do
      k:disable()
    end
  end
end

function Keys.activateKeys()
  keys = shortcuts[Keys.keyboardType()]
  for _, k in pairs(keys) do
    k:enable()
  end
end

function Keys.keyboardType()
  if not Keys.keyboard then
    Keys.keyboard = "normal"
  end
  return Keys.keyboard
end

function Keys.toggleKeyboard()
  if Keys.keyboardType() == "normal" then
    Keys.keyboard = "ergodox"
  else
    Keys.keyboard = "normal"
  end
  alert.show("Keyboard: " .. Keys.keyboardType())
  Keys.deactivateKeys()
  Keys.activateKeys()
end

return Keys
