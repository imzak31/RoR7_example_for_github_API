require 'rails_helper'

RSpec.describe "Developers", type: :request do
  describe "POST /developers" do
    context "If username found in github" do
      before { post '/developers', params: { username: 'andrew' } }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context "If username is taken" do
      Developer.create(username: 'imzak31', public_repos: 1, full_name: 'Andrew Imzak', location: 'London', 
                       language_proeficiency: { 'Ruby' => '100%' })
      before { post '/developers', params: { username: 'imzak31' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "GET /developers" do
    context "If there are developers" do
      Developer.create(username: 'imzak31', public_repos: 1, full_name: 'Andrew Imzak', location: 'London', 
        language_proeficiency: { 'Ruby' => '100%' })
      before { get '/developers?username=imzak31' }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
