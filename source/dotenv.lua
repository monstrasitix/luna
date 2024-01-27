local xstring = require "source/string"

local envs = {}

function get(key)
    return envs[key]
end

function loading(fileName)
    for line in io.lines(fileName) do
        key, value = table.unpack(
            xstring.split(line, "=")
        )

        envs[key] = value
    end
end

return {
    get = get,
    load = loading,
}
