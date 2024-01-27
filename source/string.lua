function split(line, by)
    local cursor = 1
    local output = {""}

    for char in line:gmatch(".") do
        if char == by then
            cursor = cursor + 1

            output[cursor] = ""
        else
            output[cursor] = output[cursor] .. char
        end
    end

    return output
end

return {
    split = split,
}