local json = require "source/json"
local http = require "source/http"

user1 = http.request {
    method = "GET",
    url = "https://jsonplaceholder.typicode.com/users/1",
}

user2 = http.request {
    method = "GET",
    url = "https://jsonplaceholder.typicode.com/users/2",
}

result = json.encode({
    firstName = "John",
    lastName = "Smith",
    isAlive = true,
    age = 27,
    address = {
        streetAddress = "21 2nd Street",
        city = "New York",
        state = "NY",
        postalCode = "10021-3100",
    },
    phoneNumbers = {
        {
            type = "home",
            number = "212 555-1234",
        },
        {
            type = "office",
            number = "646 555-4567",
        },
    },
})

print(user1)
print(user2)