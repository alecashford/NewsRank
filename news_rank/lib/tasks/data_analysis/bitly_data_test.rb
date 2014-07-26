require "HTTParty"

bitly_data = HTTParty.get("https://api-ssl.bitly.com/v3/search?access_token=75e1a6b81d656a6b62e6d07141a90d546f244326&limit=2")

#p bitly_data.parsed_response["data"]["results"][0]["url"]
bitly_data.parsed_response["data"]["results"].each do |x|
  p x["url"]
end
