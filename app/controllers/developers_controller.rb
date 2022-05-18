class DevelopersController < ApplicationController

  def save_developer_data 
    fetch_developer_info

    developer = Developer.new(username: params[:username], public_repos: @public_repos, full_name: @full_name, 
                              location: @location, language_proeficiency: @language_proeficiency)
    developer.save

    render json: developer, status: 201
  end

  def show_developers 
    developers = Developer.all

    render json: developers, status: 200 if developers.any?
    render json: { message: 'No developers found' }, status: 404 if developers.empty?
  end

  def find_developer_by_username 
    search = Developer.find_by(username: params[:username])
    
    render json: search, status: 200 if search
    render json: { message: 'No developer found' }, status: 404 if !search
  end

  def find_developer_by_language 
    search = Developer.search_for_proeficiency(params[:language])
    
    render json: search, status: 200 if search
    render json: { message: 'No developer found' }, status: 404 if !search
  end

  private

  def fetch_developer_info 
    info_request = GithubConnections::DeveloperDataService.call(username: params[:username])
    language_proeficiency_request = GithubConnections::DeveloperLanguageService.call(username: params[:username])

    @public_repos = info_request['public_repos']
    @full_name = info_request['name']
    @location = info_request['location']
    @language_proeficiency = language_proeficiency_request
  end
end
