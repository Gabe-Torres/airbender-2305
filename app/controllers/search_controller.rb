class SearchController < ApplicationController
  def index
    
    nation = params[:nation]
    # conn = Faraday.new(url: 'https://last-airbender-api.fly.dev')

    # response = conn.get("/api/v1/characters?affiliation=#{nation}")

    # data = JSON.parse(response.body, symbolize_names: true)

    # # @total_count = data.count

    # member = data

    # @members = member.map do |member_data|
    #   Member.new(member_data)
    # end
    # require 'pry'; binding.pry

    @members = MembersFacade.members_by_nation(nation)
  end
end