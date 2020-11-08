require 'net/http'
require 'open-uri'
require 'json'

class GetRequester
attr_accessor :URL 

    URL = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"
    
    def initialize(url)
        @URL = url
    end
    def get_response_body
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        # we use the JSON library to parse the API response into nicely formatted JSON
        name = JSON.parse(self.get_response_body)
        name.collect do |name|
          name["agency"]
          name
        end
    end
end
# Write your code here
