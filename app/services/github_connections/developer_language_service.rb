module GithubConnections
  class DeveloperLanguageService < Services::Base
    require 'rest-client'
    require 'json'

    BASE_URL = 'https://api.github.com/users/'.freeze

    def call(params)
      begin
      languages_request = RestClient.get("#{BASE_URL}#{params[:username]}/repos")
      parsed_response = JSON.parse(languages_request)
      raise ArgumentError.new('Username was not found') if languages_request.code == 404
      raise ArgumentError.new('Username cannot be blank') if params[:username].blank?
      rescue RestClient::ExceptionWithResponse => e
        raise ArgumentError.new(e.response)
      end
  
      languages = []
      parsed_response.each do |repo|
        languages << repo['language']
      end
  
      languages_hash = {}
      languages.uniq.each do |language|
        languages_hash[language] = (languages.count(language) / languages.size.to_f) * 100
        languages_hash[language] = "#{languages_hash[language]}%"
      end
      @languages_proeficiency = languages_hash
    end
  end
end
