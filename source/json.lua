local encoding = {}
local decoding = {}


function isArray(set)
    return set[1] ~= nil
end


function encoding.array(obj)
    local output = {}

    for key, value in pairs(obj) do
        output[key] = encode(value)
    end

    return string.format(
        "[%s]",
        table.concat(output, ",")
    )
end


function encoding.object(obj)
    local output = {}

    for key, value in pairs(obj) do
        table.insert(
            output,
            string.format('"%s":%s', key, encode(value))
        )
    end

    return string.format(
        "{%s}",
        table.concat(output, ",")
    )
end


function encoding.string(value)
    return string.format('"%s"', value)
end


function encoding.primitive(value)
    return value
end


function encoding.table(obj)
    return isArray(obj)
        and encoding.array(obj)
        or encoding.object(obj)
end


function encode(json)
    encoder = encoding[type(json)]

    return encoder ~= nil
        and encoder(json)
        or encoding.primitive(json)
end

function decode(text)
    return text
end


return {
    encode = encode,
    decode = decode,
}