
module GithubConnections 
  class DeveloperDataService < Services::Base
    require 'rest-client'
    require 'json'

    # Below constant is deprecated, in favour of the Constants class of this module. 
    # BASE_URL = 'https://api.github.com/users/'.freeze

    def call(params)
      begin
        basic_information_request = RestClient.get("#{Constants::BASE_URL}#{params[:username]}")
        raise ArgumentError.new('Username was not found') if basic_information_request.code == 404
        raise ArgumentError.new('Username cannot be blank') if params[:username].blank?
      # rescue RestClient::ExceptionWithResponse => e
      #   raise ArgumentError.new(e.response)
      end
      @parsed_response = JSON.parse(basic_information_request)
      @parsed_response
    end
  end
end
