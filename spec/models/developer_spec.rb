require 'rails_helper'

RSpec.describe Developer, type: :model do
  context 'validations' do
    before { described_class.create!(username: 'peter2', public_repos: 5, full_name: 'Peter Twot', 
                                    location: 'NY', language_proeficiency: {"Java"=>"50%", "JavaScript"=>"50%"}) }

    valid_developer = Developer.new(username: 'fabpot', public_repos: 34, full_name: 'Adrian Centeno',
                                    location: 'NY', language_proeficiency: {"Ruby"=>"50%", "Python"=>"50%"})
    it 'is valid with valid attributes' do
      expect(valid_developer).to be_valid
    end
    
    invalid_developer = Developer.new(id: nil, username: '', public_repos: nil , full_name: 'Adrian Centeno',
                                      location: 'NY', language_proeficiency: {"Ruby"=>"50%", "Python"=>"50%"},
                                      created_at: nil, updated_at: nil)
    it 'is with not valid without a username' do
      expect(invalid_developer).to_not be_valid
    end

    username_taken = Developer.new(username: 'peter2', public_repos: 5, full_name: 'Peter Twot',
                                   location: 'NY', language_proeficiency: {"Java"=>"50%", "JavaScript"=>"50%"} )
    it 'username is already taken' do
      expect(username_taken).to_not be_valid
    end
  end

  context 'search by proeficiency' do
    # we need to test the search_for_proeficiency method, if a developers has less that '20%' of the language, it should not be shown in that language search
    # it will not be returned.
    before { described_class.create!(username: 'peter2', public_repos: 5, full_name: 'Peter Twot', 
      location: 'NY', language_proeficiency: {"Java"=>"10%", "JavaScript"=>"90%"}) }

    it 'should not show the developer in the search' do
      expect(described_class.search_for_proeficiency('Java')).to eq nil
    end

    it 'should show the developer in the search' do
      expect(described_class.search_for_proeficiency('JavaScript')).to eq ([Developer.last])
    end
  end
end
