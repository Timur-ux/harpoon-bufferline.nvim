local function GetAbsPath(path)
    if string.sub(path, 1, 1) == "/" then
        return path
    end
    return vim.fn.getcwd() .. "/" .. path
end
---@param item HarpoonListItem
local function GetBufferLineBufferFromHarpoonItem(item)
    local absPath = GetAbsPath(item.value)
    print("Search for buffer: " .. absPath)
    for _, bufferElement in ipairs(bufferline.get_elements().elements) do
        if bufferElement.path == absPath then
            return bufferElement
        end
    end
    return nil
end
local log = require("harpoon-bufferline.util.log")
local config = require("harpoon-bufferline.config")

local HarpoonBufferline = {}

-- setup HarpoonBufferline, assume that harpoon2 and bufferline already setuped
function HarpoonBufferline.setup(opts)
    opts = opts or {}
    local group = opts.group or config.DEFAULT_GROUP
    local harpoon = require("harpoon")
    local bufferline = require("bufferline")

    -- extend harpoon by callbacks on add and remove buffers
    harpoon:extend({
        ADD = function(ctx)
            local item = ctx.item
            local buffer = GetBufferLineBufferFromHarpoonItem(item)
            if not buffer then
                log.notify(
                    "setup",
                    vim.log.levels.WARN,
                    "Can't find bufferline buffer for item: %s",
                    item.value
                )
                return
            end
            bufferline.groups.add_element(group, buffer)
            log.debug("setup", "Susseccfully add buffer: %s to %s group", item.value, group)
        end,
        REMOVE = function(ctx)
            local item = ctx.item
            local buffer = GetBufferLineBufferFromHarpoonItem(item)
            if not buffer then
                log.notify(
                    "setup",
                    vim.log.levels.WARN,
                    "Can't find bufferline buffer for item: %s",
                    item.value
                )
                return
            end
            bufferline.groups.remove_element(group, buffer)
            log.debug("setup", "Susseccfully remove buffer: %s from %s group", item.value, group)
        end,
    })
end

_G.HarpoonBufferline = HarpoonBufferline

return _G.HarpoonBufferline
