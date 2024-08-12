version = "0.21.9"

local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

require("xpm").setup({
  plugins = {
    'dtomvan/xpm.xplr',
    'sayanarijit/tri-pane.xplr',
    'sayanarijit/command-mode.xplr',
    'Junker/nuke.xplr',
  }
})

require("tri-pane").setup()

require("nuke").setup{
  pager = "more", -- default: less -R
  open = {
    run_executables = true, -- default: false
    custom = {
      {extension = "jpg", command = "sxiv {}"},
      {mime = "video/mp4", command = "vlc {}"},
      {mime_regex = "^video/.*", command = "smplayer {}"},
      {mime_regex = ".*", command = "hx {}"}
    }
  },
  view = {
    show_line_numbers = true, -- default: false
  },
  smart_view = {
    custom = {
      {extension = "so", command = "ldd -r {} | less"},
    }
  }
}

--- Key bindings

local m = require("command-mode")

-- Setup with default settings
m.setup()


xplr.config.modes.builtin.default.key_bindings.on_key["e"] = {
  help = "edit",
  messages = {
    {
      BashExecSilently0 = [===[
        vim "${XPLR_FOCUS_PATH:?}"
      ]===],
    },
  },
}

local key = xplr.config.modes.builtin.default.key_bindings.on_key

key.v = {
  help = "nuke",
  messages = {"PopMode", {SwitchModeCustom = "nuke"}}
}
key["f3"] = xplr.config.modes.custom.nuke.key_bindings.on_key.v
key["enter"] = xplr.config.modes.custom.nuke.key_bindings.on_key.o
