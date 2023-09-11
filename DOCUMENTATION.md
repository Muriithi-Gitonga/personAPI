# personAPI

Welcome to the documentation for personAPI. This API allows you to create, read, update and delete person from a database.

## Getting Started
Base URL: `https://userapi-production-741d.up.railway.app`

If you are using a local server, the base url will be `http://localhost:3000` be sure to check the [README](README.md) on how to start the project.

## API Endpoints
| Endpoint | Functionality | Description | HTTP method |
| --- | --- | --- | --- |
| `/` | Home | The home page of the api | `GET` |
| `/api` | Create | Create a new person | `POST` |
| `/api/:user_id` | Read | Get a single person | `GET` |
| `/api/:user_id` | Update | Update a single person | `PUT` |
| `/api/:user_id` | Delete | Delete a single person | `DELETE` |

### Create a new person
- Endpoint: `/api`
- HTTP method: `POST`
- Request body: `name` (string, required)
- Request body example:
```json
{
    "name": "Tosh"
}
```
- Example Response(success):
```json
{
    "id": 1,
    "name": "Tosh"
}
```
- Example Response(error): - This can occur if an empty or null string is passed 
Returns the errors as an array
```json
{
    "errors": [
        "Name can't be blank"
    ]
}
```


## Retrieve a User by ID
- Endpoint: `/api/:user_id`
- HTTP method: `GET`
- Description: Get a single person by id
- Path Parameter: `id` (integer, required)
- Example Response(success):
```json
{
    "id": 1,
    "name": "Tosh"
}
```
- Example Response(error): -Incase the person is not found
```json
{
    "error": "Person not found" 
}
```

## Update a User by ID
- Endpoint: `/api/:user_id`
- HTTP method: `PUT`
- Description: Update a single person by id
- Path Parameter: `id` (integer, required)
- Request body: `name` (string, required)
- Request body example:
```json
{
    "name": "Tosh"
}
```
- Example Response(success):
```json
{
    "id": 1,
    "name": "Tosh"
}
```
- Example Response(error): -Incase the person is not found
```json
{
    "error": "Person not found" 
}
```
- Example Response(error): - This can occur if an empty or null string is passed
Returns the errors as an array
```json
{
    "errors": [
        "Name can't be blank"
    ]
}
```
## Delete a User by ID
- Endpoint: `/api/:user_id`
- HTTP method: `DELETE`
- Description: Delete a single person by id
- Path Parameter: `id` (integer, required)






