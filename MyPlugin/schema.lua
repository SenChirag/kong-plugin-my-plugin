return {
    no_consumer = true, -- This plugin is not specific to any consumer
    fields = {
        key_to_extract = { type = "string", required = true, default = "my_key" },
    },
    self_check = function(schema, plugin_t, dao, is_updating)
        -- Custom validation logic can be added here
        return true
    end
}
