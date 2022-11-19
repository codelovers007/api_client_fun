require "uri"
require 'net/http'
require 'json'

module ApiClientFun
  class Request    
    def initialize(path)
      @path = path
      @users = nil
    end

    # Fetch all the users
    def fetch
      res = Net::HTTP.get_response(full_path)
      users = JSON.parse(res.body)
      users.dig("users")
    end

    # Fetch users and find by user_name and return profile
    def profile_for_name(user_name)
      users = self.fetch
      user = users.find{ |user| user['name'] == user_name }
      user.dig('profile')
    end

    private

    def full_path
      URI.parse("https://blooming-savannah-20593.herokuapp.com/api#{@path}")
    end
  end
end