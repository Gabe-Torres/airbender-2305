class SearchController < ApplicationController
  def index
    
    nation = params[:nation]
    conn = Faraday.new(url: 'https://last-airbender-api.fly.dev')

    response = conn.get("/api/v1/characters?affiliation=#{nation}")

    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    
  end
end