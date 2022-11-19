require "api_client_fun/version"
require "api_client_fun/request"

module ApiClientFun
  def self.profile_for_name(user_name)
    request = Request.new('/users')
    request.profile_for_name(user_name)
  end
end
