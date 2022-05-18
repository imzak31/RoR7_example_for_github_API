# frozen_string_literal: true

Rails.application.routes.draw do
  post '/developers', to: 'developers#save_developer_data'
  get 'developers' => 'developers#show_developers'
  get 'developers/search' => 'developers#find_developer_by_language'
  get 'developers/username' => 'developers#find_developer_by_username'
end
