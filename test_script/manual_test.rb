require 'net/http'
require 'json'

# Set the base URL for your API

# Helper method to send HTTP requests
def send_request(http_method, path, data = nil)
    base_url = 'https://userapi-production-741d.up.railway.app/'
  uri = URI.parse("#{base_url}/#{path}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true # Use SSL for secure connections

  request_class = case http_method
                  when :get then Net::HTTP::Get
                  when :post then Net::HTTP::Post
                  when :put then Net::HTTP::Put
                  when :delete then Net::HTTP::Delete
                  else
                    raise "Unsupported HTTP method: #{http_method}"
                  end

  request = request_class.new(uri)
  request['Content-Type'] = 'application/json' if data

  request.body = data.to_json if data

  response = http.request(request)
   # Check if the response body is not nil before parsing it
  response_body = response.body
  parsed_body = response_body ? JSON.parse(response_body) : {}

  { code: response.code.to_i, body: parsed_body }
end

# Test case: Create a user
create_user_data = { name: 'John Doe' }
response = send_request(:post, 'api', create_user_data)
id = response[:body]['id']
puts 'Create User Test:'
puts "Response Code: #{response[:code]}"
puts "Response Body: #{response[:body].to_json}"
puts

# Test case get user
user_id = id
response = send_request(:get, "api/#{user_id}")
puts 'Get User Test:'
puts "Response Code: #{response[:code]}"
puts "Response Body: #{response[:body].to_json}"
puts


# Test case: Update a user 
user_id = id
update_user_data = { name: 'Updated Name' }
response = send_request(:put, "api/#{user_id}", update_user_data)
puts 'Update User Test:'
puts "Response Code: #{response[:code]}"
puts "Response Body: #{response[:body].to_json}"
puts

# Test case: Delete a user 
user_id = id
response = send_request(:delete, "api/#{user_id}")
puts 'Delete User Test:'
puts "Response Code: #{response[:code]}"
puts "Response Body: #{response[:body].to_json}"
puts