
require 'net/http'
require 'uri'
require 'json'

# Send SIGNL4 alert from Ruby

# SIGNL4 team secret
team_secret = "team-secret"

# Alert data
alert_data = { "Title" => "Alert", "Message" => "SIGNL4 alert from Ruby" }.to_json

url = "https://connect.signl4.com/webhook/" + team_secret

res = Net::HTTP.post URI(url),
    alert_data,
    "Content-Type" => "application/json"

# Status
puts res.code
puts res.message

# Body
puts res.body

case res
when Net::HTTPSuccess, Net::HTTPRedirection
  if res.code == "201"
    # Success
    puts "Success"
  else
    # Error
    puts "Error1"
  end
else
  # Error
  puts "Error"
end
