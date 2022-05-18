require 'rails_helper'

RSpec.describe GithubConnections::DeveloperLanguageService do
  describe '#call' do
    it 'returns a hash' do
      expect(GithubConnections::DeveloperLanguageService.call(username: 'andrew')).to be_a(Hash)
    end

    it 'returns an exception if username is blank' do
      # just making sure that an error is raised if username is blank
      expect { GithubConnections::DeveloperLanguageService.call(username: '') }.to raise_error(GithubConnections::DeveloperLanguageService::Error)
    end

    it 'returns an exception if username is not found' do
      expect { GithubConnections::DeveloperLanguageService.call(username: 'not_found') }.to raise_error(GithubConnections::DeveloperLanguageService::Error)
    end
  end
end
