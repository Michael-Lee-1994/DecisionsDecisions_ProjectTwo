require "json"
require 'http'
require_relative '../config/SECRETS.rb'
class Yelp

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/" 
DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "american"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 20
YELP_API_KEY = API_KEY
def self.search(term="cuisine", location)
    url = "#{API_HOST}#{SEARCH_PATH}"
    params = {
        term: term,
        location: location,
        limit: SEARCH_LIMIT
    }
    response = HTTP.auth("Bearer #{YELP_API_KEY}").get(url, params: params)
    response.parse
end

end
