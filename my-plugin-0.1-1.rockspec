package = "kong-plugin-my-plugin"
version = "0.1-1"
source = {
    url = "git://github.com/SenChirag/kong-plugin-my-plugin.git",
    branch = "main",
}
description = {
    summary = "Kong custom plugin to fetch a key's value from request body and append it to the URL",
    homepage = "https://github.com/SenChirag/kong-plugin-my-plugin",
    license = "MIT",
}
dependencies = {
    "lua >= 5.1, < 5.4",
    "kong >= 2.6",
}
build = {
    type = "builtin",
    modules = {
        ["kong.plugins.my-plugin.handler"] = "MyPlugin/handler.lua",
        ["kong.plugins.my-plugin.schema"] = "MyPlugin/schema.lua",
    },
}
