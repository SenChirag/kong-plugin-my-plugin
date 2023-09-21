local BasePlugin = require "kong.plugins.base_plugin"

local MyPlugin = BasePlugin:extend()

function MyPlugin:new()
    MyPlugin.super.new(self, "my-plugin")
end

function MyPlugin:access(config)
    MyPlugin.super.access(self)

    local body_data = ngx.req.get_body_data() -- Get the request body data

    if body_data then
        local key = config.key_to_extract
        local value = ngx.escape_uri(string.match(body_data, key .. "=(.-)&")) -- Assuming URL-encoded form data
        
        if value then
            local uri = ngx.var.uri
            local new_uri = uri .. "?" .. key .. "=" .. value
            ngx.var.uri = new_uri
        end
    end
end

return MyPlugin
