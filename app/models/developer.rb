# frozen_string_literal: true

class Developer < ApplicationRecord
  # ACTIVE RECORD VALIDATIONS
  validates :username, presence: true, uniqueness: true, allow_nil: false
  validates :public_repos, presence: true, allow_nil: false
  validates :full_name, presence: true, allow_nil: false
  validates :location, presence: true, allow_nil: false
  validates :language_proeficiency, presence: true, allow_nil: false

  BASE_URL = 'https://api.github.com/users/'.freeze

  def self.search_for_proeficiency(language)
    developers = []
    # Now we need to select all the developers that have the language in the key of the languages_proeficiency hash.
    # And the value of the hash is the proeficiency and must be greater than 20%
    # We must order the developers by the proeficiency in descending order.
    Developer.all.each do |developer|
      if developer.language_proeficiency.key?(language) && developer.language_proeficiency[language] > '20%'
        developers << developer
      end
    end
    # If there is no developer with the language, we return nil
    return nil if developers.count.zero?

    # We need to order the developers by the proeficiency in descending order.
    developers.sort_by { |developer| developer.language_proeficiency[language] }.reverse
  end
end

