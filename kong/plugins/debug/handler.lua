local BasePlugin = require "kong.plugins.base_plugin"
local log = require "kong.cmd.utils.log"
local json = require "cjson"

local DebugHandler = BasePlugin:extend()

function DebugHandler:new()
    DebugHandler.super.new(self, "debug")
end

function DebugHandler:header_filter(config)
    DebugHandler.super.header_filter(self)

    local ctx = ngx.ctx or {}
    local header = ngx.header
    header["X-Kong-API"] = json.encode(ctx)
end

return DebugHandler

