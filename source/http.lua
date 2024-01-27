TEMP_FILE = "./temp/http"

function request(obj)
    os.execute(
        string.format("curl -X %s -s %s > %s",
            obj.method,
            obj.url,
            TEMP_FILE
        )
    )

    return io.open(TEMP_FILE, "r"):read("*a")
end

return {
    request = request,
}