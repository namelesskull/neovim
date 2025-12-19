local M = {}

vim.g.media_status = ""

local timer = vim.loop.new_timer()

timer:start(
  0,
  3000,
  vim.schedule_wrap(function()
    local h = io.popen("playerctl metadata --format '{{status}}|{{artist}}|{{title}}' 2>/dev/null")
    if not h then
      vim.g.media_status = ""
      return
    end

    local out = h:read("*a") or ""
    out = out:gsub("%z", ""):gsub("\n", "")
    h:close()

    local status, artist, title = out:match("([^|]+)|([^|]+)|(.+)")
    if not status then
      vim.g.media_status = "ワンピース"
      return
    end

    local icon = status == "Playing" and "Now playing: " or "Now playing: "
    local function trim_text(text, max_len)
      if not text then
        return ""
      end
      if #text <= max_len then
        return text
      end
      return text:sub(1, max_len - 1) .. "…"
    end

    vim.g.media_status = trim_text(string.format("%s %s - %s", icon, artist, title), 70)
  end)
)

return M
